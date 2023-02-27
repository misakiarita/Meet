class Feature < ApplicationRecord
  validates :dog_or_cat, presence: true
  validates :color, presence: true
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :pet_age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sex, presence: true
  belongs_to :pet
  enum dog_or_cat:{"犬":1, "猫":2}
  enum sex:{"男の子":1, "女の子":2}
end
