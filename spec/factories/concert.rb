FactoryBot.define do
  factory :concert do
    name { Faker::Music }
    city { Faker::Music }
  end
end
