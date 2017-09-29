class AddTelephoneToAccounts < ActiveRecord::Migration[5.1]
  def change
    change_table :accounts do |t|
      t.string :telephone
    end
  end
end
