require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
    
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは＠を含む必要があること' do
          @user.email = 'example.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end