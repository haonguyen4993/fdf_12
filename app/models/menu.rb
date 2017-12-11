class Menu < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  has_many :menu_settings
  has_many :items

  enum kind: {main_item: 0, sub_item: 1, bonus_item: 2}

  scope :menus_of_shop, -> shop_id {where(shop_id: shop_id).includes(:items)}
end
