FactoryBot.define do
  factory :place_comment do
    body { Faker::Lorem.characters(number: 10) }
    rate { 5 }
  end
end
