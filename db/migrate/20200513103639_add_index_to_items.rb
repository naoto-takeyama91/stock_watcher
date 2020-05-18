class AddIndexToItems < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :name, length: 10
  end
end
