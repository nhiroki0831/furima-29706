class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = OrderShipping.new
  end

  # def new
  #   @order = OrderShipping.new
  # end

  def create
    @order = OrderShipping.new(order_params)
    @order.save
  end  

  private

  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :tel, :order_id)
  end

  #def order_params (メソッド名を後で修正)
    #params.permit(:price, :token)
  #end

  #def pay_item
    #Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    #Payjp::Charge.create(
      #amount: order_params[:price],
      #card: order_params[:token],
      #currency:'jpy'
    #)
  #end

end