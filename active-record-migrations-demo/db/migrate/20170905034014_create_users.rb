# 生成用于创建表的迁移文件
# $ rails generate migration CreareUsers
# Running via Spring preloader in process 64684
      # invoke  active_record
      # create    db/migrate/20170905034014_create_users.rb
class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    end
  end
end
