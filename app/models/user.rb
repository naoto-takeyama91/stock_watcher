class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :item_inventories, through: :item
  has_many :purchase_histories, through: :item

  with_options presence: true do
    validates :name
    validates :email
  end 
  
end
