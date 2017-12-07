class Menu < ApplicationRecord
  belongs_to :shop
  belongs_to :user
  has_many :menu_settings

  VALID_NAME_REGEX = /\A[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬ
    ẮẰẲẴẶẸẺẼỀẾỂưăạảấầẩẫậắằẳẵặẹẻẽềếểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴ
    ÝỶỸửữựỳýỵỷỹ]{1}[ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀẾỂ
    ưăạảấầẩẫậắằẳẵặẹẻẽềếểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳýỵỷỹ
    a-zA-Z0-9\-\_\ ]{0,}+\z/

  serialize :item, Array
  enum kind: {main_item: 0, sub_item: 1, bonus_item: 2}
  validate :items

  private

  def items
    return errors.add(:item, I18n.t("wrong_presence")) if item.blank?
    item.each_with_index do |name, index|
      if VALID_NAME_REGEX.match(name).nil?
        message = I18n.t("item") + (index + Settings.increase_one).to_s + I18n.t("wrong_format")
        return errors.add(:item, message)
      end
      if  name.length > Settings.menu.max_item
        message = I18n.t("item") + (index + Settings.increase_one).to_s + I18n.t("wrong_length") + Settings.menu.max_item.to_s
        return errors.add(:item, message)
      end
    end
  end
end
