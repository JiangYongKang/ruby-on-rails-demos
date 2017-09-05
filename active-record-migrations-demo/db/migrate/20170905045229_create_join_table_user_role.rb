# 创建联结数据表
# $ rails generate migration CreateJoinTableUserRole user role                                                                                                                                   12:51:08  ☁  master ☂ ✭
# Running via Spring preloader in process 67060
      # invoke  active_record
      # create    db/migrate/20170905045229_create_join_table_user_role.rb
class CreateJoinTableUserRole < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :roles do |t|
      t.index [:user_id, :role_id]
      t.index [:role_id, :user_id]
    end
  end
end
