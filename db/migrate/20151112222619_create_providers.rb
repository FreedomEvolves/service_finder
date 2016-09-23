class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :last_name
      t.string :first_name
      t.string :title
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :years_of_experience
      t.string :category
      t.string :specialty

      t.timestamps null: false
    end
  end
end
