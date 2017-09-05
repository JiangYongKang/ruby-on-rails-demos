# 创建表的时候指明多个字段
# $ rails generate migration CreateAccounts user_name:string password:string
# Running via Spring preloader in process 66856
      # invoke  active_record
      # create    db/migrate/20170905044959_create_accounts.rb
class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :user_name
      t.string :password
    end
  end
end
