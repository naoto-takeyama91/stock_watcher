class Item < ApplicationRecord
  belongs_to :user
  has_many :inventories
  has_many :purchase_histories

  with_options presence: true do
    validates :name
    validates :term
  end
end
