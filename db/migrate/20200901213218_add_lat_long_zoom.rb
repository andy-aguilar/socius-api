class AddLatLongZoom < ActiveRecord::Migration[6.0]
  def change
    add_column :runs, :latitude, :float
    add_column :runs, :longitude, :float
    add_column :runs, :zoom, :float
  end
end
