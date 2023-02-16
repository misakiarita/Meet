class Pet < ApplicationRecord
  belongs_to :user
  has_many :petpics, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  # 会話ルームがどのpet(案件)と紐づいているかがわかる
  has_many :conversations
  # 該当petのidをupet_idとして持つconversationのレコードが参照可能 => それに紐づくuser(conversationの作成者)がわかる
  has_many :conversations_users, through: :conversations, source: :pet
  accepts_nested_attributes_for :petpics
end
