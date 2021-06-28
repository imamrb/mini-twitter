def seed
  Rails.logger.info 'Seeding database..'

  user = FactoryBot.create(:user, email: 'user@example.com', password: 'password')

  15.times do
    tweet = FactoryBot.create(:tweet, author: user)
    follow = FactoryBot.create(:follow, follower: user)
    FactoryBot.create(:follow, follower: follow.following, following: user )

    rand(3..5).times do
      comment = FactoryBot.create(:comment, commentable: tweet)

      rand(1..5).times do
        FactoryBot.create(:like, likeable: comment)
      end
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
