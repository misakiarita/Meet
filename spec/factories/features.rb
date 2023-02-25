FactoryBot.define do
  factory :feature do
    association :pet
    dog_or_cat {1}
    color { "白" }
    weight {3}
    pet_age {1}
    sex {2}
  end
end

