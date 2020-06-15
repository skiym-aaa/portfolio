FactoryBot.define do
  factory :place do
    name { 'ららぽーと豊洲' }
    address { Faker::Lorem.characters(number: 30) }
  end
end
