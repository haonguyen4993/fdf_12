class AddDeletedAtToOrderPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :order_posts, :deleted_at, :datetime
    add_index :order_posts, :deleted_at
  end
end
