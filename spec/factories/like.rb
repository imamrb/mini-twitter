FactoryBot.define do
  factory :like, class: 'Like' do
    user
    for_tweet

    trait :for_tweet do
      association :likeable, factory: :tweet
    end

    trait :for_comment do
      association :likeable, factory: :comment
    end
  end
end
