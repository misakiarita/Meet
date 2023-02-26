require 'rails_helper'
RSpec.describe 'メッセージ機能', type: :system do
  describe 'メッセージの送信テスト' do
    context '一般ユーザーが詳細画面からリンクを押すと' do
      it 'メッセージのindexからメッセージの送信ができる' do
        FactoryBot.create(:second_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'user2@gmail.com'
        fill_in 'user[password]', with: 'user2@gmail.com'
        page.all(:link_or_button, 'ログイン')[1].click
        visit pets_path
        page.all(:link_or_button, '詳細ページ')[1].click
        click_on 'メッセージを送る'
        click_on 'この案件のメッセージ'
        fill_in 'message[body]', with: 'Hello!'
        click_on 'メッセージを送る'
        expect(page).to have_content 'user2'
      end
    end
  end
end

