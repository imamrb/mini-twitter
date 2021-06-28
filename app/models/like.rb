class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  # Ensure that one entity can be liked only once
  validates :user_id, presence: true, uniqueness: { scope: %i(likable_id likable_type) }
end
