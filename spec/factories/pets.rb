FactoryBot.define do
  factory :pet do
    association :user
    pet_name { 'めと' }
    pet_address {1}
    qualify_age {30}
    status {1}
    price {10000}
  end

  factory :second_pet do
    association :seconduser
    pet_name { 'ひなの' }
    pet_address {2}
    qualify_age {60}
    status {1}
    price {10000}
  end

end

