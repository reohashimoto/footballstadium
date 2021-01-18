FactoryBot.define do
  factory :match do
    home_team_name {Faker::Lorem.sentence}
    away_team_name {Faker::Lorem.sentence}
    league {Faker::Lorem.sentence}
    place {Faker::Lorem.sentence}
    home_team_score {2}
    away_team_score {3}
    date {"2020-03-07"}
    association :user
  end
end