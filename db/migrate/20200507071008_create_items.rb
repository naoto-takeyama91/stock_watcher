class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer do |t|
      t.string :name
      t.references :user
      t.references :inventory
      t.string :image
      t.string :url
      t.integer :term, null: false
      t.timestamps
    end
  end
end
