class Order < ApplicationRecord
  attr_accessor :cart, :change_status
  acts_as_paranoid
  belongs_to :user
  belongs_to :shop
  belongs_to :coupon
  belongs_to :domain

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  has_many :events , as: :eventable

  validates :shop, presence: true

  enum status: {pending: 0, accepted: 1, rejected: 2, done: 3}
  delegate :name, :phone, to: :shop, prefix: :shop
  delegate :name, :chatwork_id, to: :user, prefix: :user, allow_nil: true
  delegate :name, to: :domain, prefix: :domain, allow_nil: true
  delegate :name, to: :coupon, prefix: :coupon, allow_nil: true

  after_update :build_order_products
  after_create :build_order_products
  after_create_commit :create_notification
  after_create :check_status_order, if: -> {self.pending?}

  scope :of_user_ids, -> ids {where user_id: ids}
  scope :by_date_newest, ->{order created_at: :desc}
  scope :unfinished, ->{where.not status: Order.statuses[:done]}
  scope :is_rejected, -> {where.not status: Order.statuses[:rejected]}
  scope :by_domain, -> domain_id {where domain_id: domain_id if domain_id.present?}
  scope :by_domain_ids, -> ids {where domain_id: ids}

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end

  scope :between_date, -> begin_date, end_date do
    where("date(created_at) >= ? AND date(created_at) <= ?", begin_date, end_date)
  end

  scope :group_day_this_week, -> do
    where(created_at: Time.now.beginning_of_week..Time.now.end_of_week).
      group_month.group_day
  end

  scope :group_week_this_month, -> do
    where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).
      group_month.group "EXTRACT(week FROM created_at)"
  end

  scope :group_month_this_year, -> do
    where(created_at: Time.now.beginning_of_year..Time.now.end_of_year).
      group_year.group_month
  end

  scope :group_year , -> {group "EXTRACT(year FROM created_at)"}
  scope :group_month, -> {group "EXTRACT(month FROM created_at)"}
  scope :group_day, -> {group "EXTRACT(day FROM created_at)"}
  scope :on_today, -> {where "date(orders.created_at) = date(now())"}

  scope :orders_list_by_date, ->{order created_at: :desc}
  scope :orders_of_shop_pending, -> shop_id do where shop_id: shop_id,
    status: Settings.filter_status_order.pending
  end
  scope :list_order_by_domain, -> (shop_id,domain_id) do where shop_id: shop_id,
    status: Settings.filter_status_order.pending, domain_id: domain_id
  end
  scope :list_orders_id_by_domain, -> do select{|s|
    s.order_products.detect{|o| o.pending?} == nil}.pluck(:id)
  end
  scope :orders_by_list_id, -> list {where id: list}

  scope :in_date, ->start_date, end_date do
    case
    when end_date.present? && start_date.present?
      where("DATE(created_at) <= ? AND created_at >= ?",
        end_date.to_date, start_date.to_date)
    when end_date.present?
      where("DATE(created_at) <= ?", end_date.to_date)
    when start_date.present?
      where("created_at >= ?", start_date.to_date)
    else
      where "DATE(created_at) = date(now())"
    end
  end

  def build_order_products
    unless self.change_status
      if cart.present?
        cart.items.each do |item|
          product = Product.find_by id: item.product_id
          unless Time.now.is_between_short_time?(product.start_hour, product.end_hour)
            order_products.create product_id: item.product_id,
              quantity: item.quantity, user_id: user_id, notes: item.notes
          end
        end
      end
    end
  end

  class << self
    def group_by_orders_by_created_at
      orders_list_by_date.group_by{|i| i.created_at.beginning_of_day}
    end

    def build_data_chart user_shops, category_statistic
      order_chart = case category_statistic
      when "current_week"
        map_hash user_shops, :group_day_this_week
      when "current_month"
        map_hash user_shops, :group_week_this_month
      when "current_year"
        map_hash user_shops, :group_month_this_year
      when "year"
        map_hash user_shops, :group_year
      else
        map_hash user_shops, :group_day_this_week
      end
    end

    def build_data_between_date user_shops, begin_date, end_date
      user_shops.map do |shop|
        {name: shop.name, data: shop.orders.
          between_date(begin_date, end_date).count}
      end
    end

    def map_hash user_shops, method_send
      user_shops.map do |shop|
        {name: shop.name, data: shop.orders.send(method_send).count}
      end
    end
  end

  def total_price
    order_products.inject(0){|sum, item| sum + item.total_price}
  end

  def total_pay_user user
    order_products.done.by_user(user)
      .inject(0){|sum, item| sum + item.total_price}
  end

  def total_price_accepted
    order_products.accepted
      .inject(0){|sum, item| sum + item.total_price}
  end

  def create_notification
    if self.products.size != Settings.count_tag
      shop_managers = self.shop.shop_managers
      shop_managers.each do |s|
        if s.owner? || s.manager?
          if !s.user.notification_settings.present? ||
            s.user.notification_settings.values[Settings.index_zero_in_array] == Settings.serialize_true
            Event.create message: Settings.notification_new,
              user_id: s.user_id, eventable_id: shop.id,
              eventable_type: Order.name, eventitem_id: self.id
          end
        end
      end
    end
  end

  def create_event_done products_done, products_rejected
    if !self.user.notification_settings.present? ||
      self.user.notification_settings.values[Settings.index_one_in_array] == Settings.serialize_true
      Event.create message: :done,
        user_id: self.user.id, eventable_id: shop.id, eventable_type: OrderProduct.name,
        eventitem_id: self.id
    end
    shop_managers = self.shop.shop_managers
    shop_managers.each do |s|
      if s.owner? || s.manager?
        if !s.user.notification_settings.present? ||
          s.user.notification_settings.values[Settings.index_one_in_array] == Settings.serialize_true
          Event.create message: :done,
            user_id: s.user_id, eventable_id: shop.id, eventable_type: User.name,
            eventitem_id: self.id
        end
      end
    end
  end

  def create_event_reject
    Event.create message: :rejected,
      user_id: user_id, eventable_id: id, eventable_type: Order.name
  end

  def create_event_order
    Event.create message: :sent_order,
      user_id: user_id, eventable_id: id, eventable_type: Order.name
  end
  private

  def update_new_status_order
    if self.pending?
      if self.order_products.accepted.present?
        order_products_pending = self.order_products.pending
        if order_products_pending.present?
          order_products_pending.update_all status: :rejected
        end
      else
        self.update_attributes status: :done, change_status: true
        self.order_products.update_all status: :rejected
        self.create_event_reject
      end
    end
  end

  def check_status_order
    delay(run_at: time_auto_reject_order.minutes.from_now)
      .update_new_status_order
  end

  def time_auto_reject_order
    self.shop.time_auto_reject.hour * Settings.minute_constant + self.shop.time_auto_reject.min
  end
end
