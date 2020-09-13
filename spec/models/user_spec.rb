require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録機能' do
    context '新規登録成功' do
      it "必要な項目が全て入力済み"do
        expect(@user).to be_valid
      end
      it "passwordは6文字以上で登録できる"do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        expect(@user).to be_valid
      end
    end


    context '新規登録失敗'do
      it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない"do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "family_nameが空だと登録できない" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end
      it "first_name_kが空だと登録できない" do
      @user.first_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank", "First name k is invalid")
      end
      it "first_name_kが全角カタカナ以外だと登録できない" do
      @user.first_name_k = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k is invalid")
      end
      it "family_name_kが空だと登録できない" do
      @user.family_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name k can't be blank", "Family name k is invalid")
      end
      it "family_name_kが全角カタカナ以外だと登録できない" do
      @user.family_name_k = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name k is invalid")
      end
      it "birthdayが空だと登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end   
end