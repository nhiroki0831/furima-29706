class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @item = Item.find(1)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end  
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :category, :condition, :delivery_fee, :delivery_area, :shipping_day, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
