class MenuSetting < ApplicationRecord
  belongs_to :menu

  validates :price, presence: true,
    numericality: {greater_than: Settings.min_price,
    less_than_or_equal_to: Settings.product.max_price}
  validates_numericality_of :maximum, greater_than_or_equal_to: Settings.menu_setting.min_number,
    less_than_or_equal_to: Settings.menu_setting.max_number
  validates_numericality_of :coeficient, greater_than_or_equal_to: Settings.menu_setting.min_number,
    less_than_or_equal_to: Settings.menu_setting.max_number
end
