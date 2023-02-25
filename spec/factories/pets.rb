FactoryBot.define do
  factory :pet do
    association :user
    pet_name { 'めと' }
    pet_address {1}
    qualify_age {30}
    status {1}
    price {0}
  end
end

