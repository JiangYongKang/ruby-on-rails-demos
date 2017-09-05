# 修改原有字段的类型
# $ rails generate migrationg FixUsersColumnType
# Running via Spring preloader in process 70774
      # invoke  active_record
      # create    db/migrate/20170905053510_fix_users_column_type.rb
class FixUsersColumnType < ActiveRecord::Migration[5.1]
  def change
    # change_column :表名, :字段名, :类型, 字段修饰符
    change_column :users, :name, :string, limit: 15
  end
end
