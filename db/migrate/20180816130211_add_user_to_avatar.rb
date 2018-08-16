class AddUserToAvatar < ActiveRecord::Migration
  def change
    add_reference :avatars, :user, index: true
    add_foreign_key :avatars, :users
  end
end
