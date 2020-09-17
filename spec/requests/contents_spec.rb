require 'rails_helper'

RSpec.describe "Contents", type: :request do
  before do
    @content = FactoryBot.create(:content)
    @user = FactoryBot.build(:user)
    @user.id = 1
    @user.save
    sign_in @user
  end
  
  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが帰ってくる" do
      get root_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する" do 
      get root_path
      expect(response.body).to include @content.image.name
    end
  end
  
  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
      get content_path(@content)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do
      get content_path(@content)
      expect(response.body).to include @content.text
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する" do
      get content_path(@content)
      expect(response.body).to include @content.image.name
    end
    it "showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する" do
      get content_path(@content)
      expect(response.body).to include "コメント"
    end
  end
  
  describe "GET #edit" do
    it "editアクションにリクエストすると正常にレスポンスが帰ってくる" do
      get edit_content_path(@content)
      expect(response.status).to eq 200
    end
    it "editアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する" do
      get edit_content_path(@content)
      expect(response.body).to include @content.text
    end
    it "editアクションにリクエストするとレスポンスに投稿済みのツイートの画像URLが存在する" do 
      get edit_content_path(@content)
      expect(response.body).to include @content.image.name
    end
    it "editアクションにリクエストするとレスポンスに編集ボタンが存在する" do 
      get edit_content_path(@content)
      expect(response.body).to include "編集する"
      expect(response.body).to include "写真を編集する"
    end
  end

end

