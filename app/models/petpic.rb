class Petpic < ApplicationRecord
  belongs_to :pet
  mount_uploader :picture, ImageUploader   
end
