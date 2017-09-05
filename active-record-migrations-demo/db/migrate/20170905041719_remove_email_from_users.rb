# 删除已存在表中的字段
# $ rails generate migration RemoveEmailFromUsers email:string
# Running via Spring preloader in process 66412
      # invoke  active_record
      # create    db/migrate/20170905041719_remove_email_from_users.rb
class RemoveEmailFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email, :string
  end
end
