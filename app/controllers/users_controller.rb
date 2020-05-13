class UsersController < ApplicationController
  before_action :set_items, only: :index

  def index
    update_itemInventory(@items)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_items
    @items = current_user.items
  end

  def update_itemInventory(items)
    items.map { |item|
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

end
