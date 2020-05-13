class Items::SearchesController < ApplicationController
  before_action :set_items
  
  def index
    redirect_to root_path if params[:keyword].empty?
    @searchItems = current_user.items.search(params[:keyword])
  end

  private

  def set_items
    @items = current_user.items
  end

end
