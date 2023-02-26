require 'rails_helper'
RSpec.describe 'userモデル', type: :model do
  describe 'バリデーションのテスト' do
    context 'nameが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.create(name:'', email: 'tanaka@1.com', password:'tanaka@1.com', role:1, address:1, user_age:20 )
        expect(user).not_to be_valid
      end
    end

    context 'emailが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.create(name:'たなか', email: '', password:'tanaka@1.com', role:1, address:1, user_age:20 )
        expect(user).not_to be_valid
      end
    end

    context 'roleが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.create(name:'たなか', email: 'tanaka@1.com', password:'tanaka@1.com', role:'', address:1, user_age:20 )
        expect(user).not_to be_valid
      end
    end

    context 'addressが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.create(name:'たなか', email: 'tanaka@1.com', password:'tanaka@1.com', role:1, address:'', user_age:20 )
        expect(user).not_to be_valid
      end
    end

    context 'user_ageが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.create(name:'たなか', email: 'tanaka@1.com', password:'tanaka@1.com', role:1, address:1, user_age:'' )
        expect(user).not_to be_valid
      end
    end

    context 'ユーザーが記載されているの場合' do
      it 'バリデーションにひっかからない' do
        user = User.create(name:'たなか', email: 'tanaka@1.com', password:'tanaka@1.com', role:1, address:1, user_age:'18' )
        expect(user).to be_valid
      end
    end

  end
end
