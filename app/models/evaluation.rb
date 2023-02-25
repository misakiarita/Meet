class Evaluation < ApplicationRecord
 
  belongs_to :user
  validates :point, presence: true

end
