class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :last_name
      t.string :first_name
      t.string :gender
      t.date :date_of_birth
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country

      t.timestamps null: false
    end
  end
end
