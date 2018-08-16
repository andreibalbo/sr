class AddOccurrenceToImages < ActiveRecord::Migration
  def change
    add_reference :images, :occurrence, index: true
    add_foreign_key :images, :occurrences
  end
end
