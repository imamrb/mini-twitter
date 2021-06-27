class User < ApplicationRecord
  include Clearance::User
  # Virtual attribute for terms and service
  validates :terms_of_service, acceptance: true

  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/.freeze

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

  has_many :tweets,
           class_name: 'Tweet',
           dependent: :destroy,
           foreign_key: 'author_id'
end
