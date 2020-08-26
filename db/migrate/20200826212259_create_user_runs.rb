class CreateUserRuns < ActiveRecord::Migration[6.0]
  def change
    create_table :user_runs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
