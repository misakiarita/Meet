class Petpic < ApplicationRecord
  mount_uploader :picture, ImageUploader   
  belongs_to :pet
  # version :thumb do
  #   process resize_to_limit: [100, 100]
  #   default_url "/images/cat_mike.png" # デフォルトの画像URLを指定
  # end
end
