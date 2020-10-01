require 'rails_helper'
describe Comment do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメント送信成功' do
      it '必要な項目を全て入力済' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント送信失敗' do
      it 'コメントがないと送信できない' do
        @comment.comment = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'userが紐ついていないと登録できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'itemが紐ついていないと登録できない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Itemを入力してください')
      end      
    end
  end
end