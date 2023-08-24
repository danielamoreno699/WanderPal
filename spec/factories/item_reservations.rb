# spec/factories/item_reservations.rb
FactoryBot.define do
    factory :item_reservation do
      association :item, factory: :item
      association :reservation, factory: :reservation
    end
  end
  