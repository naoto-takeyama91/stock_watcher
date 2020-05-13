class Item < ApplicationRecord
  belongs_to :user
  has_one :item_inventory
  has_many :purchase_histories
  has_many :categories, through: :item_category
  has_many :item_categories

  validates :name, presence: true
  validates :term,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1
    }

  def self.search(keyword)
    Item.where('name LIKE(?)', "%#{keyword}%")
  end
end
