# 创建外键字段并添加主外键约束
# $ rails generate migration AddDeptRefToUsers dept:references
# Running via Spring preloader in process 66624
      # invoke  active_record
      # create    db/migrate/20170905044808_add_dept_ref_to_users.rb
class AddDeptRefToUsers < ActiveRecord::Migration[5.1]
  def change
    # add_reference :外键所在表, :主键所在表, foreign_key:true
    add_reference :users, :dept, foreign_key: true
  end
end
