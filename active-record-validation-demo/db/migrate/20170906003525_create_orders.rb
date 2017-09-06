class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :no
      t.decimal :total, precision: 5, scale: 2

      t.timestamps
    end
  end
end
