require 'rails_helper'
RSpec.describe '詳細モデル', type: :model do
  before do
    @current_user = User.find_by(email: "user1@gmail.com")
    @pet = Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '30', status: 1, price: '10000', user_id: @current_user.id)
  end
  describe 'バリデーションのテスト' do
    context 'Featureが空の場合' do
      it 'バリデーションにひっかる' do
        feature = Feature.create(dog_or_cat: :猫, color: '失敗テスト', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)
        expect(feature).not_to be_valid
      end
    end


    context 'Featureが記載されているの場合' do
      it 'バリデーションにひっかからない' do
        second_feature = Feature.create(dog_or_cat: 2, color: '黒', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)
        expect(second_feature).to be_valid
      end
    end

  end
end

# t.string "dog_or_cat"
#   t.string "color"
#   t.integer "weight"
#   t.integer "pet_age"
#   t.text "note"
#   t.integer "sex"

# t.string "pet_name"
# t.integer "pet_address"
# t.integer "qualify_age"
# t.integer "status"
# t.integer "price"
# t.bigint "user_id"