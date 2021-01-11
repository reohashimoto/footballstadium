class Match < ApplicationRecord
  with_options presence: true do
    validates :home_team_name
    validates :away_team_name
    validates :home_team_image
    validates :away_team_image
      validates :home_team_score, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }
      validates :away_team_score, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }
      validates :date
      validates :league
      validates :place
 end
      belongs_to :user
      has_one_attached :home_team_image
      has_one_attached :away_team_image
end
