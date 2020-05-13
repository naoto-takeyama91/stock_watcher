class PurchaseHistoriesController < ApplicationController
  before_action :set_item, except: :index

  def index
    @purchaseHistories = []
    if current_user.items.present?
      @items = current_user.items
      @items.each do |item|
        @purchaseHistories.concat(item.purchase_histories) if item.purchase_histories.present?
      end
    end
    return @purchaseHistories.sort!{|a,b| b[:created_at] <=> a[:created_at]}
  end

  def new
    @purchaseHistory = PurchaseHistory.new
  end

  def create
    @purchaseHistory = PurchaseHistory.new(purchaseHistory_params)
    if @purchaseHistory.save
      @item.item_inventory.amount += @purchaseHistory.amount * 100
      @item.item_inventory.save
      redirect_to root_path
    else
      flash.now[:alert] = '入力内容に誤りがあります'
      render :new
    end
  end

  private

  def purchaseHistory_params
    params.require(:purchase_history).permit(:amount).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
