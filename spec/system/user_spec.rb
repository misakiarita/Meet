require 'rails_helper'
RSpec.describe 'ユーザー登録機能', type: :system do
  describe '一般ユーザ登録のテスト' do
    context '一般ユーザー新規作成した場合' do
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
end