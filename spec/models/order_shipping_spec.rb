require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_shipping).to be_valid
    end
    it 'postal_codeが入力されていないと保存できないこと' do
      @order_shipping.postal_code = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end
    it 'postal_codeにハイフンが含まれていないと登録できない事' do
      @order_shipping.postal_code = '1234567'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefecture_idが選択されていないと保存できないこと' do
      @order_shipping.prefecture_id = 1
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが入力されていないと保存できないこと' do
      @order_shipping.city = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが入力されていないと保存できないこと' do
      @order_shipping.address = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it 'buildingが入力されていなくても保存できること' do
      @order_shipping.building = nil
      expect(@order_shipping).to be_valid
    end
    it 'telが入力されていないと保存できないこと' do
      @order_shipping.tel = nil
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include("Tel can't be blank", 'Tel is invalid')
    end
    it 'telが半角数字で11桁以上あると保存できないこと' do
      @order_shipping.tel = '090123456789'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Tel is invalid')
    end
    it 'telにハイフンが含まれていると保存できないこと' do
      @order_shipping.tel = '090-1234-5678'
      @order_shipping.valid?
      expect(@order_shipping.errors.full_messages).to include('Tel is invalid')
    end
  end
end
