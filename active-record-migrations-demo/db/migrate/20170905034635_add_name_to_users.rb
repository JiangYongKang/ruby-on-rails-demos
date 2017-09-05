# 向已有表中添加字段
# $ rails generate migration AddNameToUsers name:string
# Running via Spring preloader in process 65191
      # invoke  active_record
      # create    db/migrate/20170905034635_add_name_to_users.rb
class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    # add_column :表名, :字段名, :字段类型
    add_column :users, :name, :string
  end
end
