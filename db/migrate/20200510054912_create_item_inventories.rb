class CreateItemInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_inventories do |t|
      t.integer :amount, null: false
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
