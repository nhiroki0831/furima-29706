require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end

    context '配送先情報保存成功' do      
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingが入力されていなくても保存できること' do
        @order_shipping.building = nil
        expect(@order_shipping).to be_valid
      end
    end
    context '配送先情報保存失敗' do
      it 'postal_codeが入力されていないと保存できないこと' do
        @order_shipping.postal_code = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号を入力してください", "郵便番号はハイフン(-)を使用してください")
      end
      it 'postal_codeにハイフンが含まれていないと登録できない事' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("郵便番号はハイフン(-)を使用してください")
      end
      it 'prefecture_idが選択されていないと保存できないこと' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが入力されていないと保存できないこと' do
        @order_shipping.city = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが入力されていないと保存できないこと' do
        @order_shipping.address = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("番地を入力してください")
      end
      it 'telが入力されていないと保存できないこと' do
        @order_shipping.tel = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号を入力してください", "電話番号はハイフン(-)を使用せず数字のみ入力して下さい")
      end
      it 'telが半角数字で11桁以上あると保存できないこと' do
        @order_shipping.tel = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号はハイフン(-)を使用せず数字のみ入力して下さい")
      end
      it 'telにハイフンが含まれていると保存できないこと' do
        @order_shipping.tel = '090-1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("電話番号はハイフン(-)を使用せず数字のみ入力して下さい")
      end
      it 'tokenにデータが含まれていると保存できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("カード情報を入力してください")
      end
    end  
  end
end
