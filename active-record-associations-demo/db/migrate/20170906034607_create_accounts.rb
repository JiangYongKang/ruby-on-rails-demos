class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :user_name
      t.string :password

      t.timestamps null: false
    end
  end
end
