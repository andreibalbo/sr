class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :from
      t.integer :to

      t.timestamps null: false
    end
  end
end
