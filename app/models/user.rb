class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :avatar, ImageUploader     
  has_many :pets       
  has_many :favorites, dependent: :destroy
  has_many :favorite_pets, through: :favorites, source: :pet
end
