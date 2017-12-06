class Shop < ApplicationRecord
  strip_attributes only: [:description, :name]
  attr_accessor :crop_avatar_x, :crop_avatar_y, :crop_avatar_w, :crop_avatar_h
  CROP_SHOP_AVATAR = [:crop_avatar_x, :crop_avatar_y, :crop_avatar_w, :crop_avatar_h]

  attr_accessor :cover_crop_x, :cover_crop_y, :cover_crop_w, :cover_crop_h
  CROP_COVER = [:cover_crop_x, :cover_crop_y, :cover_crop_w, :cover_crop_h]
  acts_as_paranoid
  acts_as_followable

  ratyrate_rateable Settings.rate

  after_update :check_status_shop
  before_destroy :destroy_event
  before_save :set_domain_for_shop

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [:name, [:name, :id]]
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed? || super
  end

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :reviews, as: :reviewable
  has_many :comments, as: :commentable
  has_many :shop_managers, dependent: :destroy
  has_many :users, through: :shop_managers
  has_many :orders, dependent: :destroy
  has_many :order_products, through: :orders
  has_many :products, dependent: :destroy
  has_many :tags, through: :products
  has_many :events , as: :eventable
  has_many :shop_domains, dependent: :destroy
  has_many :domains, through: :shop_domains
  has_many :request_shop_domains

  enum status: {pending: 0, active: 1, closed: 2, rejected: 3, blocked: 4}

  enum status_on_off: {off: 0, on: 1}

  after_create :create_shop_manager, :send_notification_after_requested
  after_update :send_notification_after_confirmed
  after_update_commit :send_notification

  VALID_NAME_REGEX = /\A[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬ
    ẮẰẲẴẶẸẺẼỀẾỂưăạảấầẩẫậắằẳẵặẹẻẽềếểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴ
    ÝỶỸửữựỳýỵỷỹ]{1}[ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀẾỂ
    ưăạảấầẩẫậắằẳẵặẹẻẽềếểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳýỵỷỹ
    a-zA-Z0-9\-\_\ ]{0,}+\z/

  validates :name, presence: true, format: {with: VALID_NAME_REGEX},
    length: {maximum: Settings.shop.max_name}
  validates :description, presence: true, length: {maximum: Settings.shop.max_description}
  validates :time_auto_reject, presence: true, allow_nil: true
  validates :phone, presence: true, numericality: {only_integer: true},
    length: {maximum: Settings.shop.max_number_phone}, allow_nil: true

  mount_uploader :cover_image, ShopCoverUploader
  mount_uploader :avatar, ShopAvatarUploader

  mount_base64_uploader :avatar, ShopAvatarUploader
  mount_base64_uploader :cover_image, ShopCoverUploader

  validate :image_size

  delegate :name, to: :owner, prefix: :owner, allow_nil: true
  delegate :email, to: :owner, prefix: :owner
  delegate :avatar, to: :owner, prefix: true

  scope :by_date_newest, ->{order created_at: :desc}
  scope :top_shops, ->{by_date_newest.limit Settings.index.max_shops}

  scope :by_active, ->{where status: :active}
  scope :of_owner, -> owner_id {where owner_id: owner_id}
  scope :by_shop, -> shop_id {where id: shop_id if shop_id.present?}

  scope :of_ids, -> ids {where id: ids}
  scope :shop_in_domain, -> domain_id do
    joins(:shop_domains)
      .where("shop_domains.domain_id = ? and shop_domains.status = ?", domain_id,
      ShopDomain.statuses[:approved]).order("status_on_off DESC, true")
  end

  scope :list_shops, -> ids {where id: ids}

  def destroy_event
    Event.by_model_and_id(Shop.name, self.id).destroy_all
    Event.by_model_and_id(OrderProduct.name, self.id).destroy_all
    Event.by_model_and_id(User.name, self.id).destroy_all
  end

  def is_owner? user
    owner == user
  end

  def is_manager? user_id
    shop_manager = self.shop_managers.find_by user_id: user_id
    return shop_manager.present? && shop_manager.manager?
  end

  def all_tags
    tags.uniq
  end

  def get_shop_manager_by user
    shop_managers.by_user(user).first
  end

  def requested? domain
    Shop.of_ids(RequestShopDomain.shop_ids_by_domain(domain.id)).include? self
  end

  def in_domain? domain
    self.domains.include? domain
  end

  def request_status domain
    self.shop_domains.by_domain(domain).first
  end

  def create_event_request_shop user_id, shop
    if shop.pending?
      Event.create message: :new_shop,
        user_id: user_id, eventable_id: id, eventable_type: Shop.name
    end
  end

  def create_event_close_shop
    Event.create message: :shop_off,
      user_id: owner_id, eventable_id: id, eventable_type: Shop.name
  end

  def shop_owner? user_id
    self.owner_id == user_id
  end

  private
  def create_shop_manager
    shop_managers.create user_id: owner_id
  end

  def image_size
    max_size = Settings.pictures.max_size
    if cover_image.size > max_size.megabytes
      errors.add :cover_image,
        I18n.t("pictures.error_message", max_size: max_size)
    end
    if avatar.size > max_size.megabytes
      errors.add :avatar, I18n.t("pictures.error_message", max_size: max_size)
    end
  end

  def send_notification_after_requested
    ShopNotification.new(self).send_when_requested
  end

  def send_notification_after_confirmed
    if self.previous_changes.has_key? :status
      ShopNotification.new(self).send_when_confirmed
    end
  end

  def send_notification
    if self.previous_changes.has_key? :status
      Event.create message: self.status, user_id: owner_id,
        eventable_id: id, eventable_type: Shop.name
    end
  end

  def update_new_status_shop
    self.update_attributes(status_on_off: :off, delayjob_id: nil)
    self.create_event_close_shop
  end

  def auto_open_shop
    time_now = DateTime.now
    time_run_job = time_now.change({hour: self.time_close.hour, min: self.time_close.min})
    if time_run_job < time_now
      time_run_job += 1.day
    end
    shop_job = delay(run_at: time_run_job).auto_close_shop
    status_before = self.status_on_off
    self.update_columns status_on_off: :on, delayjob_id: shop_job.id
    send_chatwork_message if status_before == Settings.shop_status_off
  end

  def auto_close_shop
    time_now = DateTime.now
    time_run_job = time_now.change({hour: self.time_open.hour, min: self.time_open.min})
    if time_run_job < time_now
      time_run_job += 1.day
    end
    shop_job = delay(run_at: time_run_job).auto_open_shop
    status_before = self.status_on_off
    self.update_columns status_on_off: :off, delayjob_id: shop_job.id
    self.create_event_close_shop
    send_chatwork_message if status_before == Settings.shop_status_on
  end

  def check_type_close_shop
    time_now = DateTime.now
    time_run_job = time_now.change({hour: self.time_auto_close.hour, min: self.time_auto_close.min})
    if time_run_job < time_now
      time_run_job += 1.day
    end
    if self.openforever.to_s == Settings.checked_false
      if self.status_on_off == Settings.shop_status_on
        shop_job = delay(run_at: time_run_job).update_new_status_shop
        self.update_column :delayjob_id, shop_job.id
      end
    else
      time_now = DateTime.now
      time_open = time_now.change({hour: self.time_open.hour, min: self.time_open.min})
      time_close = time_now.change({hour: self.time_close.hour, min: self.time_close.min})
      time_close += 1.day if time_open >= time_close
      case
      when time_now < time_open
        auto_close_shop
      when time_open <= time_now && time_now < time_close
        auto_open_shop
      when time_close <= time_now
        auto_close_shop
      end
    end

  end

  def check_status_shop
    if time_open_changed? || time_close_changed? ||
      openforever_changed? || status_on_off_change || time_auto_close_change
      check_type_close_shop
    end
    send_chatwork_message if status_on_off_changed?
  end

  def send_chatwork_message
    SendShopStatusToChatworkJob.perform_later self
  end

  def set_domain_for_shop
    if self.status == "active" && !check_shop_in_domain
      ShopDomain.create domain_id: get_domain(self.owner).id, shop_id: self.id, status: 1
    elsif self.status != "active" && check_shop_in_domain
      self.shop_domains.destroy_all
    end
  end

  def check_shop_in_domain
    return self.shop_domains.present?
  end

  def get_domain user
    self.owner.domains.first || Domain.first
  end
end
