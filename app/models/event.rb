class Event < ApplicationRecord
  include ActionView::Helpers::DateHelper

  after_create_commit :send_notification

  belongs_to :user
  belongs_to :eventable, polymorphic: true

  scope :by_date, -> {order created_at: :desc}
  scope :unread, -> {where read: false}
  scope :by_model_and_id, -> model, id do where eventable_type: model,
    eventable_id: id
  end

  scope :events_of_admin, ->{Event.where("eventable_type LIKE '%#{Admin.name}%'")}

  def of_user? user
    self.user == user
  end

  def load_message
    case eventable_type
    when Shop.name
      check_admin_accept_shop_request_status
    when Product.name
      "#{I18n.t "products"} #{eventable.name} #{I18n.t "notification.product"}"
    when Order.name
      order_shop_event_user
    when OrderProduct.name
      order_product_event
    when User.name
      order_shop_event = Order.find_by id: eventitem_id
      "#{I18n.t "order"} #{order_shop_event.shop.name} #{I18n.t "of"}
      #{order_shop_event.user.name} #{I18n.t "shop_order_products"}"
    when ShopDomain.name
      shop_event_name_message
      domain = Domain.find_by id: eventable_id
      shop_domain = ShopDomain.find_by id: eventitem_id
      check_message domain, shop_domain
    when UserDomain.name
      check_message_user_domain
    when Domain.name
      check_message_domain
    when Post.name
      check_message_post
    when Review.name
      message
    when OrderPost.name
      message
    end
  end

  def load_message_time
    "#{time_ago_in_words(created_at)} #{I18n.t "notification.ago"}"
  end

  def get_link_img
    case eventable_type
    when Shop.name
      eventable.avatar.url
    when Product.name
      eventable.image.url
    when Order.name
      "/assets/#{message}.png"
    when OrderProduct.name
      "/assets/#{message}.png"
    when User.name
      "/assets/" + Settings.image_url.systemdone
    when ShopDomain.name
      "/assets/" + Settings.image_url.systemdone
    when UserDomain.name
      user = User.find_by id: eventitem_id
      user.avatar.url
    when Domain.name
      self.user.avatar.url
    when Post.name
      self.user.avatar.url
    when Review.name
      review = Review.find_by id: eventable_id
      review.user.avatar.url
    when OrderPost.name
      order = OrderPost.find_by id: eventable_id
      order.user.avatar.url
    end
  end

  def get_link_redirect
    case eventable_type
    when Shop.name
      "/dashboard/shops/#{eventable_id}"
    when Product.name
      "/products/#{eventable_id}/##{eventitem_id}"
    when Order.name
      if message == Settings.notification_new
        "/dashboard/shops/#{eventable_id}/orders/##{eventitem_id}"
      else
        "/orders/##{eventitem_id}"
      end
    when OrderProduct.name
      "/orders##{eventitem_id}"
    when User.name
      "/dashboard/shops/#{eventable_id}/order_managers/##{eventitem_id}"
    when ShopDomain.name
      domain = Domain.find_by id: eventable_id
      shop_domain = ShopDomain.find_by id: eventitem_id
      check_message_for_link shop_domain, domain
    when UserDomain.name
      check_link_user_domain
    when Domain.name
      "/domains?domain_id=#{eventable_id}"
    when Post.name
      post = Post.find_by id: eventable_id
      if post.domain.present?
        "/domains/#{post.domain_slug}/ads/posts/#{eventable_id}"
      elsif user.domains.present?
        "/domains/#{post.user.domains.first.slug}/ads/posts/#{eventable_id}"
      end
    when Review.name
      post = Review.find_by(id: eventable_id).reviewable
      if post.domain.present?
        "/domains/#{post.domain_slug}/ads/posts/#{post.id}"
      elsif user.domains.present?
        "/domains/#{post.user.domains.first.slug}/ads/posts/#{post.id}"
      end
    end
  end

  def check_item_exist?
    case eventable_type
    when Shop.name
      return true if Shop.find_by id: eventable_id
    when Product.name
      return true if Product.find_by(id: eventable_id) && Comment.find_by(id: eventitem_id)
    when Order.name
      if message == Settings.notification_new
        return true if Shop.find_by(id: eventable_id) && Order.find_by(id: eventitem_id)
      else
        return true if Order.find_by(id: eventable_id)
      end
    when OrderProduct.name
      return true if Order.find_by(id: eventitem_id)
    when User.name
      return true if Shop.find_by(id: eventable_id) && Order.find_by(id: eventitem_id)
    when ShopDomain.name
      return true if Domain.find_by(id: eventable_id) && ShopDomain.find_by(id: eventitem_id)
    when UserDomain.name
      return true if Domain.find_by(id: eventable_id) && User.find_by(id: eventitem_id)
    when Domain.name
      return true if Domain.find_by(id: eventable_id)
    when Post.name
      return true if Post.find_by(id: eventable_id)
    when Review.name
      return true if Review.find_by(id: eventable_id)
    when OrderPost.name
      return true if OrderPost.find_by(id: eventable_id)
    end
  end

  def check_admin_item_exist?
    case eventable_type
    when Post.name + "." + Admin.name
      return true if Post.find_by(id: eventable_id)
    end
  end

  def send_notification
    if self.eventable_type.include? Admin.name
      Admin::EventBroadcastJob.perform_now Event.events_of_admin.unread.count, self
    else
      EventBroadcastJob.perform_now self.user.events.unread.count, self
    end
    send_fcm_message self.load_message, self.user.device_id if self.user.device_id.present?
  end

  def send_fcm_message body, reg_tokens
    fcm = FCM.new ENV["FCM_KEY"]
    registration_ids = [reg_tokens]
    options = {data: {message: body}}
    response = fcm.send registration_ids, options
  end

  def order_shop_event_user
    if message == Settings.notification_new
      order_shop_event = Order.find_by id: eventitem_id
      if order_shop_event.present?
        "#{I18n.t "order"} #{order_shop_event.shop.name} #{I18n.t "of"} #{order_shop_event.user.name}
          #{I18n.t "notification.order"}"
      else
        "#{I18n.t "a_order"} #{I18n.t "order_deleted"}"
      end
    else
      order_shop_event = Order.find_by id: eventable_id
      if message == Settings.filter_status_order.rejected
        "#{I18n.t "deleted_user_order_shop"}"
      elsif order_shop_event.present?
        "#{I18n.t "user_order_products"} #{order_shop_event.shop.name}
          #{I18n.t "order_success"}"
      else
        "#{I18n.t "user_cancel_order_products"}"
      end
    end
  end

  def order_product_event
    order = Order.find_by id: eventitem_id
    if order.present?
      done_products = order.order_products.done.size
      rejected_products = order.order_products.rejected.size
      if done_products == Settings.start_count
        "#{I18n.t "order"} #{order.shop.name} #{I18n.t "request_status.rejected"}"
      else
        "#{I18n.t "order"} #{order.shop.name} #{I18n.t "order_confirm_accept"}
          #{done_products} #{I18n.t "done_products"},
            #{rejected_products} #{I18n.t "rejected_products"}"
      end
    end
  end

  def shop_event_name_message
    if eventable_type == User.name
      order_shop_event = Order.find_by id: eventitem_id
      "#{I18n.t "order"} #{order_shop_event.shop.name} #{I18n.t "of"}
        #{order_shop_event.user.name} #{I18n.t "shop_order_products"}"
    end
  end

  def check_message domain, shop_domain
    if shop_domain.present?
      case true
      when self.message == Settings.request_status.pending
        "#{I18n.t "shop_request"}#{shop_domain.shop.name}
          #{I18n.t "into_domain_request"}#{domain.name}"
      when self.message == Settings.request_status.approved
        user_domain = UserDomain.find_by user_id: user_id, domain_id: domain.id,
          role: :manager
        if user_id == domain.owner || user_domain.present?
          shop_manager = shop_domain.shop.shop_managers.find_by user_id: user_id
          if shop_manager.present? && shop_manager.manager?
            "#{I18n.t "shop_request_to_domain_owner_shop"}#{shop_domain.shop.name}
              #{I18n.t "shop_request_to_domain_owner"}#{domain.name}"
          else
            "#{I18n.t "owner_active_shop_request"}#{shop_domain.shop.name}
              #{I18n.t "to_domain"}#{domain.name}"
          end
        else
          "#{I18n.t "shop_request_to_domain_owner_shop"}#{shop_domain.shop.name}
            #{I18n.t "shop_request_to_domain_owner"}#{domain.name}"
        end
      else
        "#{I18n.t "shop_request_to_domain_owner_shop"}#{shop_domain.shop.name}
          #{I18n.t "not_accept_to_domain"}#{domain.name}"
      end
    else
      "#{I18n.t "dada_not_found"}"
    end
  end

  def check_message_for_link shop_domain, domain
    if shop_domain.present?
      case true
      when shop_domain.pending?
        "/shop_domains?domain_id=#{domain.id}"
      when shop_domain.approved?
        user_domain = UserDomain.find_by user_id: user_id, domain_id: domain.id,
          role: :manager
        if user_id == domain.owner || user_domain.present?
          "/domains?domain_id=#{domain.id}"
        else
          "/dashboard/shops"
        end
      else
        "/dashboard/shops"
      end
    else
      "#"
    end
  end

  def check_link_user_domain
    domain = Domain.find_by id: eventable_id
    user = User.find_by id: eventitem_id
    user_domain = UserDomain.find_by user_id: user_id, domain_id: domain.id,
      role: :manager
    if (domain.owner? user_id) || user_domain.present?
      "/domains?domain_id=#{domain.id}"
    elsif user_id == user.id
      "/domains/#{domain.slug}"
    end
  end

  def check_message_user_domain
    domain = Domain.find_by id: eventable_id
    user = User.find_by id: eventitem_id
    user_domain = UserDomain.find_by user_id: user_id, domain_id: domain.id,
      role: :manager
    if domain.owner? user_id
      "#{user.name}#{I18n.t "request_join_domain"}#{domain.name}"
    elsif user_domain.present?
      "#{I18n.t "domain_manager_notification"}#{domain.name}"
    elsif user.is_user? user_id
      domain_owner = User.find_by id: domain.owner
      "#{I18n.t "add_join_domain"}#{domain.name}#{I18n.t "by"}#{domain_owner.name}"
    end
  end

  def check_message_domain
    domain = Domain.find_by id: eventable_id
    domain_owner = User.find_by id: domain.owner
    user_domain = UserDomain.find_by id: eventitem_id
    if user_domain.present?
      if user_domain.manager?
        "#{domain_owner.name} #{I18n.t "add_domain_manager"} #{domain.name}"
      else
        "#{domain_owner.name} #{I18n.t "remote_domain_manager"} #{domain.name}"
      end
    else
      "#{I18n.t "request_have_been_delete"}"
    end
  end

  def check_admin_accept_shop_request_status
    case true
    when self.message == Settings.request_status.new_shop
      "#{eventable_type} #{eventable.name} #{I18n.t "admin_need_accept_shop"}"
    when self.message == Settings.request_status.pending
      "#{eventable_type} #{eventable.name} #{I18n.t "request_status.pending"}"
    when self.message == Settings.request_status.rejected
      "#{eventable_type} #{eventable.name} #{I18n.t "request_status.rejected"}"
    when self.message == Settings.request_status.active
      "#{eventable_type} #{eventable.name} #{I18n.t "request_status.active"}"
    when self.message == Settings.request_status.closed
      "#{eventable_type} #{eventable.name} #{I18n.t "request_status.closed"}"
    when self.message == Settings.request_status.block
      "#{eventable_type} #{eventable.name} #{I18n.t "request_status.blocked"}"
    when self.message == Settings.shop_off
      "#{I18n.t "shop"} #{eventable.name} #{I18n.t "notifi_shop_auto_closed"}"
    end
  end

  def check_message_post
    post = Post.find_by id: eventable_id
    I18n.t "request_post_had_been_#{message}", name: post.title
  end
end
