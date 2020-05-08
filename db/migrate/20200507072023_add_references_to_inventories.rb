class AddReferencesToInventories < ActiveRecord::Migration[5.2]
  def change
    add_reference :inventories, :item, null: false, foreign_key: true
  end
end
