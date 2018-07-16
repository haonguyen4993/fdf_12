class OrderPost < ApplicationRecord
  after_create :send_notification_to_post_owner

  strip_attributes only: :notes

  acts_as_paranoid

  belongs_to :user
  belongs_to :post

  validates :quantity, numericality: {only_integer: true,
    greater_than: Settings.orders.min_quantity}

  enum status: {pending: 0, accepted: 1, rejected: 2}

  scope :created_time_newer, ->{order created_at: :desc}

  private
  def send_notification_to_post_owner
    Event.create message: I18n.t(".order_message", sender: user.name,
      title: self.post.title),
      user_id: self.post.user_id,
      eventable_id: self.id, eventable_type: OrderPost.name
  end
end
