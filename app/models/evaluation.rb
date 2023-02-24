class Evaluation < ApplicationRecord
 
  belongs_to :user
  validates :point, presence: true

  # belongs_to :organization_user, foreign_key: :organization_user_id, class_name: 'User'
  # belongs_to :general_user, foreign_key: :general_user_id, class_name: 'User'
end
