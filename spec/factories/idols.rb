FactoryBot.define do
  factory :idol do
    name { Faker::Lorem.characters(number: 10) }
  end
end
