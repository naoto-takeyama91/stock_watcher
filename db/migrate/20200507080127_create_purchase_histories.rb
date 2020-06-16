class CreatePurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_histories, id: :integer do |t|
      t.references :user
      t.references :item
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
