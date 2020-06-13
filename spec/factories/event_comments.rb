FactoryBot.define do
  factory :event_comment do
    body { Faker::Lorem.characters(number: 10) }
  end
end
