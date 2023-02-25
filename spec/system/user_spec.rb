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

    context '一般ユーザがログインすると' do  
      it 'ペット新規投稿ができない' do
        FactoryBot.create(:second_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user2@gmail.com'
        fill_in 'user[password]', with: 'user2@gmail.com'
        page.all(:link_or_button, 'ログイン')[1].click
        visit pets_path
        expect(page).not_to have_content '新規投稿'
      end
    end

    context '管理者がログインすると' do  
      it '投稿一覧画面に管理者メニューリンクが表示される' do
        user = FactoryBot.create(:admin_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user3@gmail.com'
        fill_in 'user[password]', with: 'user3@gmail.com'
        page.all(:link_or_button, 'ログイン')[1].click
        visit user_path(user.id)
        expect(page).to have_content '管理者メニュー'
      end
    end

    describe '管理者機能のテスト' do    
      context '管理者が管理者メニューにアクセスすると' do
        it 'ユーザーの一覧を閲覧できるできる' do
          FactoryBot.create(:second_user)
          user = FactoryBot.create(:admin_user)
          visit new_user_session_path
          fill_in 'user[email]', with: 'user3@gmail.com'
          fill_in 'user[password]', with: 'user3@gmail.com'
          page.all(:link_or_button, 'ログイン')[1].click
          visit admin_users_path
          expect(page).to have_content 'user2'
        end
      end

      context '管理者が管理者メニューにアクセスすると' do
        it 'ユーザーの一覧を閲覧できるできる' do
          FactoryBot.create(:second_user)
          user = FactoryBot.create(:admin_user)
          visit new_user_session_path
          fill_in 'user[email]', with: 'user3@gmail.com'
          fill_in 'user[password]', with: 'user3@gmail.com'
          page.all(:link_or_button, 'ログイン')[1].click
          visit admin_users_path
          click_on '削除', match: :first
          expect(page.accept_confirm).to eq "本当に削除しますか？"
          expect(page).not_to have_content 'user2'
        end
      end

      context '管理者以外が管理者メニューにアクセスすると' do
        it 'Petの一覧に戻る' do
          user = FactoryBot.create(:second_user)
          visit new_user_session_path
          fill_in 'user[email]', with: 'user2@gmail.com'
          fill_in 'user[password]', with: 'user2@gmail.com'
          page.all(:link_or_button, 'ログイン')[1].click
          visit admin_users_path
          expect(page).to have_content '投稿一覧'
        end
      end
    end
      
  #セッション機能のテストのend  
  end
#RSpec.describeのend
end
