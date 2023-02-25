require 'rails_helper'
RSpec.describe 'ユーザー登録機能', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザー新規作成した場合' do
      it 'プロフィール画面にアクセスできる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'user1'
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'user1@gmail.com'
        fill_in 'user[password_confirmation]', with: 'user1@gmail.com'
        select '北海道', from: 'user_address'
        fill_in 'user[user_age]', with: '20'
        click_on '新規登録'
        click_on 'プロフィール'
        expect(page).to have_content 'user1'
      end
    end
  end


  describe 'セッション機能のテスト' do    
    context 'ログインした後' do
      it 'プロフィール画面にアクセスできる' do
        user = FactoryBot.create(:user) 

        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'user1@gmail.com'
        page.all(:link_or_button, 'ログイン')[1].click
        visit user_path(user.id)
        expect(page).to have_content 'user1'
      end

      it 'ペット一覧に詳細リンクが押せる' do
        FactoryBot.create(:feature)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'user1@gmail.com'
        page.all(:link_or_button, 'ログイン')[1].click

        visit pets_path
        click_on '投稿一覧'
        expect(page).to have_content '詳細ページ'
      end
    end

    context 'ログアウトをすると' do
      it 'ログインできるようになる' do
        FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: 'user1@gmail.com'
        page.all(:link_or_button, 'ログイン')[1].click
        click_on 'ログアウト'
        expect(page).not_to have_content 'プロフィール'
      end
    end
  #セッション機能のテストのend  
  end
#RSpec.describeのend
end
