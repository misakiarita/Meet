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

# petsテーブルとfeaturesテーブルのseed
user = User.create!(name: '小森', email: 'seed6@gmail.com', password: 'seed1@gmail.com', 
  password_confirmation: 'seed1@gmail.com', role: 1, address: 4, user_age: 60)
user.pets.create(pet_name: "My post", pet_address: "This is my first post",
  qualify_age: 3, status:0, price:10000, )


# t.string "pet_name"
# t.string "pet_address"
# t.integer "qualify_age"
# t.integer "status"
# t.integer "price"
