class OrdersController < ApplicationController

  before_action :simplification2, only: [:index, :create]

  def index
    @order = OrderShipping.new
    redirect_to root_path if @item.user == current_user
  end

  def create
    binding.pry
    @order = OrderShipping.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def simplification2
    @item = Item.find(params[:item_id])
  end

end
