require 'rails_helper'
RSpec.describe 'Petモデル機能', type: :model do
  before do
    # FactoryBot.create(:user)
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

  describe '検索機能' do

    current_user = User.find_by(email: "user1@gmail.com")
    let!(:pet) {Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '30', status: 1, price: '10000', user_id: current_user.id)}
    # let!(:feature) = {Feature.create(dog_or_cat:1, color: '黒', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)}  
    let!(:second_pet) {Pet.create(pet_name:'小次郎', pet_address: 2, qualify_age: '60', status: 1, price: '10000', user_id: current_user.id)}
    # let!(:second_feature) {Feature.create(dog_or_cat:2, color: '白', weight:'3', pet_age:'3', sex:1, pet_id: @second_pet.id)}
    context 'scopeメソッドでタ年齢検索をした場合'  do
      it "検索キーワードを含むタスクで絞り込まれる" do

        expect(Pet.below_age(60)).to include(second_pet)
        expect(Pet.below_age(60)).not_to include(pet)
        expect(Pet.below_age(60).pluck(:pet_name)).not_to include('太郎')

      end
    end

    context 'scopeメソッドでタ年齢検索をした場合'  do
      it "検索キーワードを含むタスクで絞り込まれる" do
        # expect(Task.address_search(30)).not_to include(second_feature)
        # expect(Task.species_search(30).count).to eq 1

      end
    end
  end

end
