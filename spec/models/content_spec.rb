require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @content = FactoryBot.build(:content)
  end

  describe 'コンテンツの保存' do
    context "コンテンツの保存ができる場合" do
      it "画像とテキストと地図があればコンテンツは保存される" do
        expect(@content).to be_valid
      end
      it "画像とテキストがあればコンテンツは保存される" do
        @content.map = ""
        expect(@content).to be_valid
      end
    end
    context "コンテンツが保存できない場合" do
      it  "テキストがないとコンテンツは保存できない" do
        @content.text = ""
        @content.valid?
        expect(@content.errors.full_messages).to include("Text can't be blank")
      end
      it  "画像がないとコンテンツは保存できない" do
        @content.image = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Image can't be blank")
      end
      it "ユーザーが紐ついていないとコンテンツは保存できない" do
        @content.user_id = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("User can't be blank")
      end
    end
  end

end
