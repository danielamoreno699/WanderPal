# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    image { Faker::Placeholdit.image(size: '300x300', format: 'jpg') }
    price { Faker::Commerce.price }
    description { Faker::Lorem.paragraph }
    association :user, factory: :user
  end
end
