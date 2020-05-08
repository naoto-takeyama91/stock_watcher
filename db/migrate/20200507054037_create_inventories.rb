class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.integer :amount, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end

    add_foreign_key :inventories, :users
  end
end
