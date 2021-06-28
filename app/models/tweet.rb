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
