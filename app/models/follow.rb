# == Schema Information
#
# Table name: follows
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  following_id :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_follows_on_following_id  (following_id)
#  index_follows_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (following_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'user_id', class_name: 'User'
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'
end
