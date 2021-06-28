class Tweet < ApplicationRecord
  paginates_per 15

  belongs_to :author, class_name: 'User'

  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  validates :body,
            presence: true,
            length: {
              maximum: 280,
              message: ' : Sorry, Your tweet has exceeded allowed limit 280 charcters! Please try again.'
            }
end
