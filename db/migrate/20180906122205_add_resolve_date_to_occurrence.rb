class AddResolveDateToOccurrence < ActiveRecord::Migration
  def change
    add_column :occurrences, :resolve_date, :date
  end
end
