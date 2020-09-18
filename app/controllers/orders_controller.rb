class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    #後でPAYJPの処理を記載
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end