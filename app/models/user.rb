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
            length: { minimum: 6 },
            on: :create
  validates :password,
            length: { minimum: 6 },
            allow_blank: true,
            on: :update
end
