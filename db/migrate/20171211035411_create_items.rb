class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :menu, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
