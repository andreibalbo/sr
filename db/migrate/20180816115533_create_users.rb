class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date :birth_dt
      t.string :cpf
      t.string :postal_code
      t.string :phone

      t.timestamps null: false
    end
  end
end
