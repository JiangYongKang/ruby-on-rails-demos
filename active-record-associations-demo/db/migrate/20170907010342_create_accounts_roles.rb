class CreateAccountsRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts_roles do |t|
      t.integer :account_id
      t.integer :role_id

      t.timestamps
    end
    add_foreign_key :accounts_roles, :roles,    column: "role_id",    primary_key: "id", name: "fk_accounts_users_role_id",    on_delete: :cascade
    add_foreign_key :accounts_roles, :accounts, column: "account_id", primary_key: "id", name: "fk_accounts_users_account_id", on_delete: :cascade
  end
end
