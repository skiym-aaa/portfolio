FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number: 10) }
    open_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    start_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
