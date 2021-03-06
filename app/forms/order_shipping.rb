class OrderShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を使用してください' }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'はハイフン(-)を使用せず数字のみ入力して下さい' }
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
end
