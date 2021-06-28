FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.name }
    sequence(:username) { Faker::Internet.username }
    sequence(:email) { |n| "user_#{n}@example.com" }
    location { Faker::Address.full_address }
    password { 'secretpass' }
  end
end
