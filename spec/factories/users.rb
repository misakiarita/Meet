FactoryBot.define do
  factory :user, class: User do
    #団体ユーザー
    name { "user1" }
    email { "user1@gmail.com" }
    password { "user1@gmail.com" }
    role {2}
    address {30}
    user_age {30}
  end

  factory :second_user, class: User do
    #一般ユーザー
    name { "user2" }
    email { "user2@gmail.com" }
    password { "user2@gmail.com" }
    role {1}
    address {30}
    user_age {30}
  end

  factory :admin_user, class: User do
    #adminユーザー
    name { "user3" }
    email { "user3@gmail.com" }
    password { "user3@gmail.com" }
    role {3}
    address {30}
    user_age {30}
  end

end
