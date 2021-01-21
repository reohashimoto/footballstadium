class Match < ApplicationRecord
  with_options presence: true do
    validates :home_team_name
    validates :away_team_name
    validates :home_team_image
    validates :away_team_image
      validates :home_team_score, :numericality => { :only_interger => true }
      validates :away_team_score, :numericality => { :only_interger => true }
      validates :date
      validates :league
      validates :place
    end


      belongs_to :user
      has_one_attached :home_team_image
      has_one_attached :away_team_image
      has_many :comments

      def self.search(search)
        if search != ""
          Match.where('home_team_name LIKE(?) or away_team_name LIKE(?) or league LIKE(?) or place LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
        else
          Match.all
        end
      end

end
