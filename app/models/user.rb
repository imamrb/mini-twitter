# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  address            :string
#  bio                :text
#  confirmation_token :string(128)
#  email              :citext           not null
#  encrypted_password :string(128)      not null
#  name               :string
#  remember_token     :string(128)      not null
#  username           :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email           (email) UNIQUE
#  index_users_on_remember_token  (remember_token)
#  index_users_on_username        (username) UNIQUE
#
class User < Application
  include Clearance::User

  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.freeze

  # Associations
  has_many :follows

  # user followers are other user's following
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  # user followings are where user is the follower
  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :followings, through: :following_relationships, source: :following

  has_many :tweets,
           class_name: 'Tweet',
           dependent: :destroy,
           foreign_key: 'author_id'

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
