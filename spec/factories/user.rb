# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    role { 'user' } # Default role is "user"
  end
end
