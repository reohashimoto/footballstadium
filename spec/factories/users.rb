FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    favorite_team {"あいうえお"}
    favorite_player {"あいうえお"}
    birthday {"2000-01-01"}
  end
end