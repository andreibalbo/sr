class AddOccurrenceToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :occurrence, index: true
    add_foreign_key :comments, :occurrences
  end
end
