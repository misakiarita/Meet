class Pet < ApplicationRecord
  belongs_to :user
  has_many :petpics, dependent: :destroy
  accepts_nested_attributes_for :petpics
end
