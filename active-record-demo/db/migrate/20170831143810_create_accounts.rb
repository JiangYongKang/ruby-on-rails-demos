class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.integer :user_id, limit: 8

      t.timestamps
    end
    add_foreign_key :accounts, :users, column: "user_id", primary_key: "id", name: "fk_accounts_users_user_id"
  end
end
