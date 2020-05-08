class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.bigint :user_id, null: false
      t.bigint :inventory_id, null: false
      t.string :image
      t.string :url
      t.integer :term, null: false
      t.timestamps
    end

    add_foreign_key :items, :users
    add_foreign_key :items, :inventories
  end
end
