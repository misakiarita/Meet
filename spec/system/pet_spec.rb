require 'rails_helper'
RSpec.describe 'ペット登録機能', type: :system do
  describe 'ペット登録のテスト' do
    context '団体ユーザーがペットを登録すると' do
      it '一覧画面にそのペットが表示される' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'user1@gmail.com'
      page.all(:link_or_button, 'ログイン')[1].click
      visit new_pet_path
      fill_in 'pet[pet_name]', with: 'りさ'
      select '北海道', from: 'pet_pet_address'
      fill_in 'pet[qualify_age]', with: '60'
      fill_in 'pet[price]', with: '10000'
      click_on '登録する'
      select '犬', from: 'feature_dog_or_cat'
      fill_in 'feature[color]', with: '茶色'
      fill_in 'feature[weight]', with: '6'
      fill_in 'feature[pet_age]', with: '1'
      select '女の子', from: 'feature_sex'
      click_on '登録'
      sleep(2)
      expect(page).to have_content 'りさ'
      end
    end
  end

  describe 'ペット削除のテスト' do
    context '詳細画面で削除すると' do
      it '一覧画面にそのペットが消える' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'user1@gmail.com'
      page.all(:link_or_button, 'ログイン')[1].click
      visit pets_path
      page.all(:link_or_button, '詳細ページ')[1].click
      sleep(2)
      click_on '削除'
      expect(page.accept_confirm).to eq "本当に削除しますか?"
      expect(page).not_to have_content 'めと'
      end
    end
  end

  describe 'ペット編集のテスト' do
    context '詳細画面で変更すると' do
      it '内容変更ができる' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'user1@gmail.com'
      fill_in 'user[password]', with: 'user1@gmail.com'
      page.all(:link_or_button, 'ログイン')[1].click
      visit pets_path
      page.all(:link_or_button, '詳細ページ')[1].click
      sleep(2)
      click_on '基本情報編集'
      fill_in 'pet[price]', with: '500'
      click_on '更新する'
      expect(page).to have_content '500'
      end
    end
  end
end

