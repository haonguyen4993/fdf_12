class User < ApplicationRecord
  attr_accessor :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h
  CROP_AVATAR = [:avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h]

  strip_attributes only: [:description, :name, :chatwork_id]

  acts_as_token_authenticatable
  ratyrate_rater
  acts_as_follower
  acts_as_paranoid

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged]

  def slug_candidates
    [:name, [:name, :id]]
  end

  serialize :notification_settings, Hash
  serialize :email_settings, Hash
  serialize :chatwork_settings, Hash

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:framgia]

  has_many :shop_managers, dependent: :destroy
  has_many :shops, dependent: :destroy, through: :shop_managers
  has_many :own_shops, class_name: "Shop", foreign_key: :owner_id
  has_many :comments, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :order_products
  has_many :coupons, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :user_domains, dependent: :destroy
  has_many :domains, through: :user_domains, dependent: :destroy
  has_many :own_domains, class_name: "Domain", foreign_key: :owner
  has_many :posts
  has_many :order_posts

  enum status: {wait: 0, active: 1, blocked: 2}
  mount_uploader :avatar, UserAvatarUploader
  mount_base64_uploader :avatar, UserAvatarUploader

  VALID_NAME_REGEX = /\A^[\p{L}\s'.-]+\z/

  validates :name, presence: true, format: {with: VALID_NAME_REGEX},
    length: {maximum: Settings.user.max_name}
  validates :chatwork_id, length: {maximum: Settings.user.max_chatwork_id}
  validates :address, length: {maximum: Settings.user.max_name}
  validates :description, length: {maximum: Settings.user.max_description}
  validate :image_size

  scope :by_date_newest, ->{order created_at: :desc}
  scope :by_active, ->{where status: active}
  scope :of_ids, -> ids {where id: ids}
  scope :list_all_users, -> ids {where id: ids}
  scope :user_of_list_id, -> list {where id: list}
  scope :user_of_list_id_include_role, -> list, domain_id do
    joins(:user_domains).select("users.*, user_domains.role as role_of_member")
      .where "users.id IN (?) AND user_domains.domain_id = ?", list, domain_id
  end
  scope :not_in_domain, ->domain do
    where("id NOT IN (?)", domain.users.pluck(:user_id)) if domain.users.present?
  end

  class << self
    def from_omniauth auth
      user = find_or_initialize_by email: auth.info.email
      if user.present?
        password = User.generate_unique_secure_token[0..9]
        user.name = auth.info.name
        user.provider = auth.provider
        user.remote_avatar_url = auth.info.avatar.gsub("http://", "https://") if auth.info.avatar.present?
        user.password = password if user.new_record?
        user.token = auth.credentials.token
        user.refresh_token = auth.credentials.refresh_token
        user.status = :active
        user.is_create_by_wsm = true if user.new_record?
        SendPasswordMailer.user_created_wsm(user, password).deliver_now if user.new_record?
        user.save
        add_user_to_domain_after_login_with_framgia_account user, auth.info.workspaces, auth.info.workspace_default
        user
      end
    end

    def add_user_to_domain_after_login_with_framgia_account user, workspaces, workspace_default
      workspaces.each do |workspace|
        domain = Domain.find_by name: workspace.name
        if domain.present?
          user.update_attribute :domain_default, domain.id if domain.name == workspace_default && user.domain_default != domain.id
          return if user.domain_ids.include? domain.id
          user.user_domains.create domain_id: domain.id, role: :member
        end
      end
    end
  end

  def is_user? user_id
    id == user_id
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed? || super
  end

  def add_device_id device_id
    if device_id.present? && self.device_id != device_id
      self.update_attributes device_id: device_id
    end
  end

  def add_authentication_token
    self.update_attributes authentication_token: generate_authentication_token_mobile
  end

  def is_member_of_domain? domain
    self.domains.include? domain
  end

  private
  def image_size
    max_size = Settings.pictures.max_size
    if avatar.size > max_size.megabytes
      errors.add :avatar, I18n.t("pictures.error_message", max_size: max_size)
    end
  end

  def generate_authentication_token_mobile
    loop do
      mobile_token = Devise.friendly_token
      break mobile_token if User.where(authentication_token: mobile_token).count.zero?
    end
  end
end
