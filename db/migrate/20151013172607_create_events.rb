class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :client_id
      t.integer :provider_id
      t.date :event_date
      t.text :description
      t.boolean :rating, default: nil
      t.decimal :amount_paid
      t.boolean :has_insurance, default: false
      t.boolean :client_confirmed, default: false
      t.boolean :provider_confirmed, default: false

      t.timestamps null: false
    end
  end
end

