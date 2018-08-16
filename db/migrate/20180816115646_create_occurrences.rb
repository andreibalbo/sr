class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.date :date
      t.string :location
      t.string :description
      t.integer :stars

      t.timestamps null: false
    end
  end
end
