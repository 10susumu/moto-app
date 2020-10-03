require 'rails_helper'

RSpec.describe '投稿', type: :system do

  before do
    @content = FactoryBot.build(:content)
    @user = FactoryBot.build(:user)
    @user.id = 1
    @user.save
  end
  
  context '投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      visit root_path
      sign_in(@user)
      expect(current_path).to eq root_path
      expect(page).to have_content('投稿する')
      click_on("投稿する")
      visit new_content_path
      expect(current_path).to eq new_content_path
      image_path = Rails.root.join('app/assets/images/test.png')
      attach_file('content[image]', image_path, make_visible: true)

      fill_in '本文を書く', with: @content.text
      expect{
        find('input[name="commit"]').click
      }.to change {Content.count }.by(1)
      visit root_path
      expect(page).to have_selector ".card-img-top"
    end
  end

  context 'ツイート投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_content('投稿する')
    end
  end

end
