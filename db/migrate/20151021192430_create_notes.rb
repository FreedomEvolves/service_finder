class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :event_id
      t.text :comment
      t.string :author

      t.timestamps null: false
    end
  end
end
