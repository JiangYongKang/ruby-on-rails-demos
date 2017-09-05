# 为已存在的表添加字段，同时指定该字段为外键
# $ rails generate migration AddEmailToUsers email:string:
# Running via Spring preloader in process 66179
      # invoke  active_record
      # create    db/migrate/20170905041258_add_email_to_users.rb
class AddEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string
    # add_index :表名, :索引字段
    add_index :users, :email
  end
end
