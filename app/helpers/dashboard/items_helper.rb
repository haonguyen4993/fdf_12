module Dashboard::ItemsHelper
  def load_item_list item_list
    item_list.map(&:name).join("\r\n") if item_list.present?
  end

  def is_destroy_all item_list
    return true if item_list.present?
  end
end
