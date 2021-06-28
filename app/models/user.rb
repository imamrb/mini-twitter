class User < ApplicationRecord
  include Clearance::User

  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.freeze

  # Associations
  has_many :tweets,
           class_name: 'Tweet',
           foreign_key: 'author_id',
           dependent: :destroy

  has_many :comments,
           foreign_key: 'author_id',
           class_name: 'Comment',
           dependent: :destroy


  has_many :follows

  # user followers are other user's following
  has_many :follower_relationships,
           foreign_key: :following_id,
           class_name: 'Follow',
           dependent: :destroy

  has_many :followers,
           through: :follower_relationships,
           source: :follower

  # user followings are where user is the follower
  has_many :following_relationships,
            foreign_key: :user_id,
            class_name: 'Follow',
            dependent: :destroy

  has_many :followings,
           through: :following_relationships,
           source: :following

  # Virtual attribute for terms and service
  validates :terms_of_service, acceptance: true

  validates :name, presence: true

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false }
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :password,
            presence: true,
            length: { minimum: 6 }

end
