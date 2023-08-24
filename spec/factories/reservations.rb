# spec/factories/reservations.rb
FactoryBot.define do
  factory :reservation do
    date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    city { Faker::Address.city }
    association :user, factory: :user
  end
end
