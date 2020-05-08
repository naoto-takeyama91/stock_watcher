class CreatePurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_histories do |t|
      t.bigint :user_id, null: false
      t.bigint :item_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end

    add_foreign_key :purchase_histories, :users
    add_foreign_key :purchase_histories, :items
  end
end
