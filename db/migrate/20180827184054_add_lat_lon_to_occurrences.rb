class AddLatLonToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :location_lat, :float
    add_column :occurrences, :location_lon, :float
    remove_column :occurrences, :location
  end
end
