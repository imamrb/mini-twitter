# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#
# Indexes
#
#  index_tweets_on_author_id  (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#
class Tweet < ApplicationRecord
  paginates_per 10

  belongs_to :author, class_name: 'User'

  validates :body,
             presence: true,
             length: {
               maximum: 280,
               message: ' : Sorry, Your tweet has exceeded allowed limit 280 charcters! '\
                        'Please try again.'
             }
end
