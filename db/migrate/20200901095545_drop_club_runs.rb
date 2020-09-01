class DropClubRuns < ActiveRecord::Migration[6.0]
  def change
    drop_table :club_runs
  end
end
