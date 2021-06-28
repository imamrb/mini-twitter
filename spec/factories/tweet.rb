FactoryBot.define do
  factory :tweet, class: 'Tweet' do
    body { Faker::Lorem.paragraph_by_chars(number: 256) }
    author factory: :user
  end
end
