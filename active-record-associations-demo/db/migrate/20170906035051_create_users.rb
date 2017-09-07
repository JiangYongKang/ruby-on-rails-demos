class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name,                    default: nil, limit: 30
      t.string :email,       null: true, default: nil
      t.string :telphone,    null: false,              limit: 11
      t.integer :dept_id,    null: false
      t.integer :account_id, null: false
      t.timestamps
    end
    add_foreign_key :users, :depts,    column: :dept_id,    primary_key: :id, name: "fk_users_depts_user_id",       on_delete: :cascade
    add_foreign_key :users, :accounts, column: :account_id, primary_key: :id, name: "fk_users_accounts_account_id", on_delete: :cascade
    add_index :users, [:email],    name: "idx_users_email",    unique: false
    add_index :users, [:telphone], name: "idx_users_telphone", unique: true
  end
end
