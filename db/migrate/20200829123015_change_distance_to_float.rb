class ChangeDistanceToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :runs, :distance, :float
  end
end
