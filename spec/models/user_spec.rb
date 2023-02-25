require 'rails_helper'
RSpec.describe 'ユーザーモデル', type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザーが空の場合' do
      it 'バリデーションにひっかる' do
        feature = Feature.create(dog_or_cat:'', color: '失敗テスト', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)
        expect(feature).not_to be_valid
      end
    end


    context 'ユーザーが記載されているの場合' do
      it 'バリデーションにひっかからない' do
        second_feature = Feature.create(dog_or_cat: 2, color: '黒', weight:'3', pet_age:'3', sex:1, pet_id: @pet.id)
        expect(second_feature).to be_valid
      end
    end

  end
end

t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.integer "address", null: false
    t.text "avatar"
    t.integer "role", null: false
    t.text "profile"
    t.integer "user_age", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"