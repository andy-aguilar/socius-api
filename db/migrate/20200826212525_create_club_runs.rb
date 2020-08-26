class CreateClubRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :club_runs do |t|
      t.references :club, null: false, foreign_key: true
      t.references :run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
