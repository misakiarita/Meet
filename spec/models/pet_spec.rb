require 'rails_helper'
RSpec.describe 'Petモデル機能', type: :model do
  before do
    FactoryBot.create(:user)
    @current_user = User.find_by(email: "user1@gmail.com")

  end

  describe 'バリデーションのテスト' do
    context 'ペット名前が空の場合' do
      it 'バリデーションにひっかかる' do
        pet = Pet.create(pet_name:'', pet_address: 1, qualify_age: '30', status: 1, price: '10000', user_id: @current_user.id)
        expect(pet).not_to be_valid
      end
    end

    context 'ペット譲渡地域が空の場合' do
      it 'バリデーションにひっかかる' do
        pet = Pet.create(pet_name:'太郎', pet_address: '', qualify_age: '30', status: 1, price: '10000', user_id: @current_user.id)
        expect(pet).not_to be_valid
      end
    end

    context 'ペット歳が空の場合' do
      it 'バリデーションにひっかかる' do
        pet = Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '', status: 1, price: '10000', user_id: @current_user.id)
        expect(pet).not_to be_valid
      end
    end

    context 'ペットステータスが空の場合' do
      it 'バリデーションにひっかかる' do
        pet = Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '30', status: '', price: '10000', user_id: @current_user.id)
        expect(pet).not_to be_valid
      end
    end

    context 'ペット譲渡金額が空の場合' do
      it 'バリデーションにひっかかる' do
        pet = Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '30', status: 1, price: '', user_id: @current_user.id)
        expect(pet).not_to be_valid
      end
    end

    context 'メッセージが記載されているの場合' do
      it 'バリデーションにひっかからない' do
        pet = Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '30', status: 1, price: '10000', user_id: @current_user.id)
        expect(pet).to be_valid
      end
    end
  end
end