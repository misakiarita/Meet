FactoryBot.define do
  factory :user, class: User do
    name { "user1" }
    email { "user1@gmail.com" }
    password { "user1@gmail.com" }
    role {3}
    address {30}
    user_age {30}

  end

end
