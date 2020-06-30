class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items, id: :integer do |t|
      t.references :user, type: :integer, foreign_key: true
      t.string :name, null: false
      t.string :image
      t.string :url
      t.integer :term, null: false
      t.timestamps
    end
  end
end
