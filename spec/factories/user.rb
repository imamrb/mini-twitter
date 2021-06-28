FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.name }
    sequence(:username) { |n| "user_#{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    bio { Faker::Quote.famous_last_words  }
    address { Faker::Address.full_address }
    password { 'password' }
  end
end
