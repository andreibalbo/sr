class AddUserToOccurrences < ActiveRecord::Migration
  def change
    add_reference :occurrences, :user, index: true
    add_foreign_key :occurrences, :users
  end
end
