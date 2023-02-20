class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :avatar, ImageUploader     
  has_many :pets       
  has_many :favorites, dependent: :destroy
  has_many :favorite_pets, through: :favorites, source: :pet
  has_many :evaluations  
  enum role: {general:1, organization:2, admin:3}
  enum limited_role: { general: 1, organization: 2 }, _prefix: true 
  enum address:{
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:0,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }

  # ゲストログイン
  def self.guest
    user = find_or_create_by!(email: "guest@example.com", name: 'ゲスト', address: 2, user_age: 30, role: 2) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    user
  end

  def self.admin_guest
    user = find_or_create_by!(email: "admin_guest@example.com", name: 'ゲスト', address: 3, user_age: 30, role: 3) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    user
  end

  #　会話部屋をつくった人が誰かがわかる
  has_many :conversations
  #　一対多：memberテーブルでconversation_idとuser_idが紐づいていることでどの会話部屋に所属しているのかがわかる
  has_many :members
  #　一対多：messageテーブルでどのuserの発言なのかがuser_idと紐づいていることでわかる
  has_many :messages
  
  # 該当user(conversationの作成者)のidをuser_idとして持つconversationのレコードが参照可能 => それに紐づくpetがわかる
  has_many :conversations_pets, through: :conversations, source: :user

end
