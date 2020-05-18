class Items::SearchesController < ApplicationController
  before_action :set_items
  
  def index
    @searchItems = @items.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def set_items
    @items = current_user.items
  end

end
