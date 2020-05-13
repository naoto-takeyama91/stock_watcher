class ItemInventoriesController < ApplicationController
  before_action :set_item, only: :edit

  def edit
    @itemInventory = ItemInventory.find(params[:id])
  end

  def update
    @itemInventory = ItemInventory.find(params[:id])
    if @itemInventory.update(itemInventory_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def itemInventory_params
    params.require(:item_inventory).permit(:amount).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
