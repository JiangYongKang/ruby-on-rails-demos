class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name

      t.timestamps
    end
  end
end
