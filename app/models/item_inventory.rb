class ItemInventory < ApplicationRecord
  has_one :item
  has_one :user, through: :item

  validates :amount,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    }
  
end
