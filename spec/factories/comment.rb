FactoryBot.define do
  factory :comment, class: 'Comment' do
    body { Faker::Lorem.paragraph(random_sentences_to_add: 3) }
    for_tweet

    trait :for_tweet do
      association :commentable, factory: :tweet
    end
  end
end
