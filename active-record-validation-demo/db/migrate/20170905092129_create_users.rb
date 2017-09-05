class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :sex
      t.string :email
      t.string :telphone
      t.string :status

      t.timestamps
    end
  end
end
