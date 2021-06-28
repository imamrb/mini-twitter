def seed
  Rails.logger.info 'Seeding database..'

  user = FactoryBot.create(:user, email: 'user@example.com', password: 'password')

  15.times do
    tweet = FactoryBot.create(:tweet, author: user)
    follow = FactoryBot.create(:follow, follower: user)
    anotheruser = follow.following
    FactoryBot.create(:follow, follower: anotheruser, following: user )

    rand(1..3).times do
      FactoryBot.create(:like, likeable: tweet, user: anotheruser)
    end

    rand(3..5).times do
      FactoryBot.create(:comment, commentable: tweet, author: anotheruser)
    end
  end

  Rails.logger.info 'Finished seeding database..'
end

if User.count.zero?
  Rails.logger.info 'Seeding development database..'
  seed
else
  Rails.logger.info "Skipping seedset, found existing user."
end
