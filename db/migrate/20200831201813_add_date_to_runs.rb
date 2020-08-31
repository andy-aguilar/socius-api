class AddDateToRuns < ActiveRecord::Migration[6.0]
  def change
    add_column :runs, :date, :datetime
  end
end
