FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number: 10) }
    start_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
