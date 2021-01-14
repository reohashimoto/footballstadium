class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string  :home_team_name
      t.string  :away_team_name
      t.integer :home_team_score
      t.integer :away_team_score
      t.date    :date
      t.string  :league
      t.string  :place
      t.string  :home_team_scoreler
      t.string  :away_team_scoreler
      t.string  :review
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
