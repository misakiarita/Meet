# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Devise.secret_key = '1614c111862e08e5049e3a701a39ed68f5e8fa8312e5502dcd0e2b18f9c35f5a3fe0e06dcf42025b19f001acb7d4d26925b99e1264c289c5337120222da13eb6'
User.create!(name: 'seed1', email: 'seed1@gmail.com', password: 'seed1@gmail.com', password_confirmation: 'seed1@gmail.com', role: 3, address: 3, user_age: 30)