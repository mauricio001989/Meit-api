FactoryBot.define do
  factory :user do
    name          { Faker::Name.name }
    email         { Faker::Internet.email }
    password      { Faker::Internet.password(min_length: 8, max_length: 15) }
  end
end
