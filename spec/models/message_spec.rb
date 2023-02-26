require 'rails_helper'
RSpec.describe 'メッセージモデル', type: :model do
  
  before do
    @organization = User.find_by(email: "user1@gmail.com")
    @general = User.create(name:'たなか', email: 'tanaka@1.com', password:'tanaka@1.com', role:1, address:1, user_age:'18' )
    @current_user = User.find_by(email: "user1@gmail.com")
    @pet = Pet.create(pet_name:'太郎', pet_address: 1, qualify_age: '30', status: 1, price: '10000', user_id: @current_user.id)
    @conversation = Conversation.create(pet_id: @pet.id, user_id: @general.id)
  end

  describe 'バリデーションのテスト' do
    context 'メッセージが空の場合' do
      it 'バリデーションにひっかる' do
        message = Message.create(body:'', conversation_id: @conversation.id, read:'false', user_id: @general.id)
        expect(message).not_to be_valid
      end
    end


    context 'メッセージが記載されているの場合' do
      it 'バリデーションにひっかからない' do
        message = Message.create(body:'こんにちは', conversation_id: @conversation.id, read:'false', user_id: @general.id)
        expect(message).to be_valid
      end
    end
  end

end
