require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録機能' do
    context '出品登録成功' do
      it '必要な項目を全て入力済' do
        expect(@item).to be_valid
      end
    end
    context '出品登録失敗' do
      it '画像をアップロードしないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像ファイルを選択してください')
      end
      it '商品名がないと登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品の説明がないと登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品説明を入力してください')
      end
      it 'カテゴリーが選択されていないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態が選択されていないと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担について選択されていないと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域が選択されていないと登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数について選択されていないと登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格が入力されていないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください', '販売価格は数値で入力してください')
      end
      it '価格が299円以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it '価格が10,000,000円以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it '価格は半角数字以外を入力すると登録できない' do
        @item.price = '０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'userが紐ついていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
