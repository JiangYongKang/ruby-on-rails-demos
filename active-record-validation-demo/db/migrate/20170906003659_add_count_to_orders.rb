class AddCountToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :count, :integer
  end
end
