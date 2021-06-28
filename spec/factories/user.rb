# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  address            :string
#  bio                :text
#  confirmation_token :string(128)
#  email              :citext           not null
#  encrypted_password :string(128)      not null
#  name               :string
#  remember_token     :string(128)      not null
#  username           :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email           (email) UNIQUE
#  index_users_on_remember_token  (remember_token)
#  index_users_on_username        (username) UNIQUE
#
FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.name }
    sequence(:username) { Faker::Internet.username }
    sequence(:email) { |n| "user_#{n}@example.com" }
    bio { Faker::Quote.famous_last_words  }
    address { Faker::Address.full_address }
    password { 'password' }
  end
end
