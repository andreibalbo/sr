class AddOccurrenceToStars < ActiveRecord::Migration
  def change
    add_reference :stars, :occurrence, index: true
    add_foreign_key :stars, :occurrences
  end
end
