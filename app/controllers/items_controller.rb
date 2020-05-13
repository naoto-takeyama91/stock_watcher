class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      @itemInventory = ItemInventory.create(item_id: @item.id, amount: 0)
      redirect_to root_path, notice: 'アイテムが追加されました'
    else
      flash.now[:alert] = '入力内容に誤りがあります'
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path, notice: 'アイテムを更新しました'
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :url, :term).merge(user_id: current_user.id)
  end

end
