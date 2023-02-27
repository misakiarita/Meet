require 'rails_helper'
RSpec.describe '詳細モデル', type: :model do
  before do

    @current_user = User.find_by(email: "user1@gmail.com")
    @pet = Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '30', status: 1, price: '10000', user_id: @current_user.id)
  end
  describe 'バリデーションのテスト' do
    context 'Featureが空の場合' do
      it 'バリデーションにひっかる' do
        feature = Feature.create(dog_or_cat:'', color: '失敗テスト', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)
        expect(feature).not_to be_valid
      end
    end


    context 'Featureが記載されているの場合' do
      it 'バリデーションにひっかからない' do
        second_feature = Feature.create(dog_or_cat: 2, color: '黒', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)
        expect(second_feature).to be_valid
      end
    end

    describe 'バリデーションのテスト' do
      context '年齢項目が0以下の場合' do
        it 'バリデーションにひっかる' do
          feature = Feature.create(dog_or_cat:1, color: '失敗テスト', weight:'3', pet_age:'-3', sex:1, pet_id: @pet.id)
          expect(feature).not_to be_valid
        end
      end
    end

    describe 'バリデーションのテスト' do
      context '年齢項目が0以上の場合' do
        it 'バリデーションにひっからない' do
          feature = Feature.create(dog_or_cat:1, color: '失敗テスト', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)
          expect(feature).to be_valid
        end
      end
    end

  end
end
