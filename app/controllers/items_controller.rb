class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category, :condition, :derivery_fee, :delivery_area, :shipping_day, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end  
  end
end