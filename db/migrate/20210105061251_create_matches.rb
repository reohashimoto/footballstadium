class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string  :home_team_name, null: false
      t.string  :away_team_name, null: false
      t.integer :home_team_score, null: false
      t.integer :away_team_score, null: false
      t.date    :date, null: false
      t.string  :league, null: false
      t.string  :place, null: false
      t.string  :home_team_scoreler
      t.string  :away_team_scoreler
      t.string  :review
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
