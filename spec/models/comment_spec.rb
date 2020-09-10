require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    
    before do

      @comment = FactoryBot.build(:comment)
      @user = FactoryBot.build(:user)
      @content = FactoryBot.build(:content)
      @user.id = 1
      @content.id = 1
      @user.save
      @content.save
    end
    
    describe 'コメントの保存' do
      context "コメントの保存ができる場合" do
        it "テキストがあればコメントは保存される" do
          expect(@comment).to be_valid
        end
      end
      context "コメントが保存できない場合" do
        it  "テキストがないとコメントは保存できない" do
          @comment.text = ""
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Text can't be blank")
        end
        it "ユーザーが紐ついていないとコメントは保存できない" do
          @comment.user_id = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("User can't be blank")
        end
        it "コンテンツが紐ついていないとコメントは保存できない" do
          @comment.content_id = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Content can't be blank")
        end
      end
    end
  end
end