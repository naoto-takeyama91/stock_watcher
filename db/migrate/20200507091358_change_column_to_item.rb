class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :inventories
    remove_index :items, :inventory_id
    remove_reference :items, :inventory
  end
end
