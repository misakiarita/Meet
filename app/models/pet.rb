class Pet < ApplicationRecord
  belongs_to :user
  has_many :petpics, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  accepts_nested_attributes_for :petpics
end
