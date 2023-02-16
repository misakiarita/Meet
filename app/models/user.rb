class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :avatar, ImageUploader     
  has_many :pets       
  has_many :favorites, dependent: :destroy
  has_many :favorite_pets, through: :favorites, source: :pet
  has_many :evaluations       


  #　会話部屋をつくった人が誰かがわかる
  has_many :conversations
  #　一対多：memberテーブルでconversation_idとuser_idが紐づいていることでどの会話部屋に所属しているのかがわかる
  has_many :members
  #　一対多：messageテーブルでどのuserの発言なのかがuser_idと紐づいていることでわかる
  has_many :messages
  
  # 該当user(conversationの作成者)のidをuser_idとして持つconversationのレコードが参照可能 => それに紐づくpetがわかる
  has_many :conversations_pets, through: :conversations, source: :user

end
