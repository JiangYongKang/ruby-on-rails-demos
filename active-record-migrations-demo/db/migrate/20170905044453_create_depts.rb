class CreateDepts < ActiveRecord::Migration[5.1]
  def change
    create_table :depts do |t|
      t.string :name
    end
  end
end
