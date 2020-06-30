class Item < ApplicationRecord
  belongs_to :user
  has_one :item_inventory, dependent: :destroy
  has_many :purchase_histories, dependent: :destroy

  validates :name, presence: true
  validates :term,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1
    }

  def self.update_itemInventory
    Item.all.map { |item|
      if item.item_inventory.present?
        d = item.item_inventory.updated_at.in_time_zone('Tokyo').to_date
        daysDifference = (Date.today - d).to_i
        if daysDifference > 0
          currentAmount = item.item_inventory.amount - (daysDifference * 100 / item.term)
          if currentAmount < 0
            item.item_inventory.amount = 0
          else
            item.item_inventory.amount = currentAmount
          end
          item.item_inventory.save
        end
      end
    }
  end

  def self.search(keyword)
    return Item.all unless keyword
    Item.where('name LIKE(?)', "%#{keyword}%")
  end
end
