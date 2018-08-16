class AddUserToStars < ActiveRecord::Migration
  def change
    add_reference :stars, :user, index: true
    add_foreign_key :stars, :users
  end
end
