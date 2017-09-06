class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :telphone, limit: 11
      t.string :sex, limit: 1
      t.integer :age
      t.string :status, limit: 1

      t.timestamps
    end
  end
end
