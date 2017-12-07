class CreateMenuSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_settings do |t|
      t.float :price
      t.integer :maximum
      t.integer :coeficient
      t.integer :menu_id

      t.timestamps
    end
  end
end
