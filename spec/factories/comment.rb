FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.paragraphs }
    user
    concert
  end
end
