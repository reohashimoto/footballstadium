class Like < ApplicationRecord
  belongs_to :user
  belongs_to :match
  validates_uniqueness_of :match_id, scope: :user_id
end
