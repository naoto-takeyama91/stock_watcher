class RemoveUserIdFromPurchaseHistories < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :purchase_histories, :users
    remove_index :purchase_histories, :user_id
    remove_reference :purchase_histories, :user
  end
end
