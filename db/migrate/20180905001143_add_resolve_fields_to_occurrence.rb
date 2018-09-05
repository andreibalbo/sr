class AddResolveFieldsToOccurrence < ActiveRecord::Migration
  def change
  	add_column :occurrences, :resolved, :boolean
  	add_column :occurrences, :resolve_message, :string
  end
end
