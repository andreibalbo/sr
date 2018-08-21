class AddFieldsToOccurrence < ActiveRecord::Migration
  def change
    add_column :occurrences, :occurrence_type, :boolean
    add_column :occurrences, :animal_type, :string
    add_column :occurrences, :animal_color, :string
    add_column :occurrences, :animal_size, :string
  end
end
