require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録機能' do
    context '新規登録成功' do
      it '必要な項目が全て入力済み' do
        expect(@user).to be_valid
      end
      it 'passwordは6文字以上で登録できる' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録失敗' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません', 'パスワードは6文字以上で入力してください')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください', '名前は全角で入力してください')
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を入力してください', '名字は全角で入力してください')
      end
      it 'first_name_kが空だと登録できない' do
        @user.first_name_k = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カタカナ)を入力してください', '名前(カタカナ)は全角で入力してください')
      end
      it 'first_name_kが全角カタカナ以外だと登録できない' do
        @user.first_name_k = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カタカナ)は全角で入力してください')
      end
      it 'family_name_kが空だと登録できない' do
        @user.family_name_k = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カタカナ)を入力してください', '名字(カタカナ)は全角で入力してください')
      end
      it 'family_name_kが全角カタカナ以外だと登録できない' do
        @user.family_name_k = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カタカナ)は全角で入力してください')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
