class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.integer :kind
      t.text :item
      t.integer :user_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
