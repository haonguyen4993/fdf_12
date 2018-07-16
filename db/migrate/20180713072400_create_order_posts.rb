class CreateOrderPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_posts do |t|
      t.integer :quantity
      t.text :notes
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
