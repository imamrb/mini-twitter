FactoryBot.define do
  factory :follow, class: 'Follow' do
    follower factory: :user
    following factory: :user
  end
end
