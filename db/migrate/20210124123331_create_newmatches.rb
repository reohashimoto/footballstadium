class CreateNewmatches < ActiveRecord::Migration[6.0]
  def change
    create_table :newmatches do |t|
      t.string  :home_team_name, null: false
      t.string  :away_team_name, null: false
      t.integer :home_team_score, null: false
      t.integer :away_team_score, null: false
      t.date    :date, null: false
      t.string  :league, null: false
      t.string  :place, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
