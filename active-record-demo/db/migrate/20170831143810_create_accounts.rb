class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :username, null: false, default: "", comment: ""
      t.string :password, null: false, default: "", comment: ""
      t.timestamps        null: false
    end
  end
end
