# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# usersテーブルのseed
# Devise.secret_key = '1614c111862e08e5049e3a701a39ed68f5e8fa8312e5502dcd0e2b18f9c35f5a3fe0e06dcf42025b19f001acb7d4d26925b99e1264c289c5337120222da13eb6'
# User.create!(name: '田中', email: 'seed1@gmail.com', password: 'seed1@gmail.com', 
#   password_confirmation: 'seed1@gmail.com', role: 3, address: 3, user_age: 20)
# User.create!(name: '吉野', email: 'seed2@gmail.com', password: 'seed1@gmail.com', 
#   password_confirmation: 'seed1@gmail.com', role: 2, address: 4, user_age: 30)
# User.create!(name: '紫宮', email: 'seed3@gmail.com', password: 'seed1@gmail.com', 
#   password_confirmation: 'seed1@gmail.com', role: 2, address: 4, user_age: 40)
# User.create!(name: '額田', email: 'seed4@gmail.com', password: 'seed1@gmail.com', 
#   password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 50)
# User.create!(name: '八代', email: 'seed5@gmail.com', password: 'seed1@gmail.com', 
  # password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 60)

# 団体用データ
organization = User.create!(name: '小森', email: 'seed10@gmail.com', password: 'seed1@gmail.com', 
  password_confirmation: 'seed1@gmail.com', role: 2, address: 4, user_age: 20)

# Pet/Feature/Petpicの投稿
met =  Pet.create!(pet_name: 'めと', pet_address: 4,
  qualify_age: 30, status: 1, price: 10000, user: organization)
  met.features.create(dog_or_cat:2, color:'白', weight:3, pet_age:3, note:'かわいいねこです。', sex:2)
  met.petpics.create(picture: File.open("#{Rails.root}/app/assets/images/cat_mike.png"))

fran = Pet.create!(pet_name: 'フラン', pet_address: 4,
  qualify_age: 30, status: 1, price: 10000, user: organization)
  fran.features.create(dog_or_cat:2, color:'白', weight:3, pet_age:3, note:'かわいいねこです。', sex:2)
  fran.petpics.create(picture: File.open("#{Rails.root}/app/assets/images/cat_mike.png"))

luna = Pet.create!(pet_name: 'ルナ', pet_address: 4,
  qualify_age: 30, status: 1, price: 10000, user: organization)
  luna.features.create(dog_or_cat:2, color:'白', weight:3, pet_age:3, note:'かわいいねこです。', sex:2)
  luna.petpics.create(picture: File.open("#{Rails.root}/app/assets/images/cat_mike.png"))

lisa =  Pet.create!(pet_name: 'りさ', pet_address: 4,
  qualify_age: 30, status: 1, price: 10000, user: organization)
  lisa.features.create(dog_or_cat:2, color:'白', weight:3, pet_age:3, note:'かわいいねこです。', sex:2)
  lisa.petpics.create(picture: File.open("#{Rails.root}/app/assets/images/cat_mike.png"))

alu =  Pet.create!(pet_name: 'アル', pet_address: 4,
  qualify_age: 30, status: 1, price: 10000, user: organization)
  alu.features.create(dog_or_cat:2, color:'白', weight:3, pet_age:3, note:'かわいいねこです。', sex:2)
  alu.petpics.create(picture: File.open("#{Rails.root}/app/assets/images/cat_mike.png"))

# 一般ユーザデータ
general = User.create!(name: '有坂', email: 'seed11@gmail.com', password: 'seed1@gmail.com', 
  password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 20)

tanaka = User.create!(name: '田中', email: 'seed12@gmail.com', password: 'seed1@gmail.com', 
  password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 20)

sato = User.create!(name: '佐藤', email: 'seed13@gmail.com', password: 'seed1@gmail.com', 
  password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 20)

ogura = User.create!(name: '小倉', email: 'seed14@gmail.com', password: 'seed1@gmail.com', 
  password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 20)

fuwa = User.create!(name: '不破', email: 'seed15@gmail.com', password: 'seed1@gmail.com', 
  password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 20)


# チャットルームデータ
met_conversation = Conversation.create!(user: general, pet: met)
fran_conversation = Conversation.create!(user: general, pet: fran)
lisa_conversation = Conversation.create!(user: general, pet: lisa)
alu_conversation = Conversation.create!(user: general, pet: alu)
luna_conversation = Conversation.create!(user: general, pet: luna)

# チャットルーム参加メンバー
Member.create!(conversation: met_conversation, user: general)
Member.create!(conversation: met_conversation, user: organization)

Member.create!(conversation: fran_conversation, user: general)
Member.create!(conversation: fran_conversation, user: organization)

Member.create!(conversation: lisa_conversation, user: general)
Member.create!(conversation: lisa_conversation, user: organization)

Member.create!(conversation: alu_conversation, user: general)
Member.create!(conversation: alu_conversation, user: organization)

Member.create!(conversation: luna_conversation, user: general)
Member.create!(conversation: luna_conversation, user: organization)


# メッセージデータ
Message.create!(body:'よろしくお願いします。有坂', conversation: met_conversation, user: general, read: false)
Message.create!(body:'よろしくお願いします。小森', conversation: met_conversation, user: organization, read: false)
Message.create!(body:'5月いかがですか？小森', conversation: fran_conversation, user: organization, read: false)
Message.create!(body:'17時にお願いします。小森', conversation: luna_conversation, user: organization, read: false)
Message.create!(body:'ありがとうございます。小森', conversation: alu_conversation, user: organization, read: false)

# お気に入りデータ
favorite = Favorite.create!(user: general, pet: met) 
favorite = Favorite.create!(user: general, pet: fran) 
favorite = Favorite.create!(user: general, pet: luna) 
favorite = Favorite.create!(user: general, pet: alu) 
favorite = Favorite.create!(user: general, pet: lisa) 


#  評価データ
evaluation = Evaluation.create!(evaluation_comment: 'お取引ありがとうございました。', 
  organization_user_id: organization.id, point: 5, user: general)

Evaluation.create!(evaluation_comment: 'お取引ありがとうございました。', organization_user_id: organization.id, point: 5, user: tanaka)
Evaluation.create!(evaluation_comment: 'お取引ありがとうございました。', organization_user_id: organization.id, point: 5, user: sato)
Evaluation.create!(evaluation_comment: 'お取引ありがとうございました。', organization_user_id: organization.id, point: 5, user: ogura)
Evaluation.create!(evaluation_comment: 'お取引ありがとうございました。', organization_user_id: organization.id, point: 5, user: fuwa)
