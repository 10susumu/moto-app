require 'rails_helper'

RSpec.describe Chat, type: :model do
  before do
    @chat = FactoryBot.build(:chat)
    @user = FactoryBot.build(:user)
    @user.id = 2
    @user.save
  end
  describe 'チャットの保存' do
    context "チャットの保存ができる場合" do
      it "テキストがあればチャットは保存される" do
        expect(@chat).to be_valid
      end
    end
    context "チャットが保存できない場合" do
      it  "テキストがないとチャットは保存できない" do
        @chat.text = ""
        @chat.valid?
        expect(@chat.errors.full_messages).to include("Text can't be blank")
      end
      it "ユーザーが紐ついていないとチャットは保存できない" do
        @chat.user_id = nil
        @chat.valid?
        expect(@chat.errors.full_messages).to include("User can't be blank")
      end
    end
  end

end
