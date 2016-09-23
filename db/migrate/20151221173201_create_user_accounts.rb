class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.integer :user_id, null: false
      t.integer :provider_id
      t.integer :client_id

      t.timestamps null: false
    end

    add_index :user_accounts, :user_id, unique: true
    add_index :user_accounts, :provider_id
    add_index :user_accounts, :client_id
  end
end
