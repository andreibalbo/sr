class AddLocationstringToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :location_string, :text
  end
end
