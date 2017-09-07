class User < ApplicationRecord
  # 用户和部门一对多
  belongs_to :dept

  # 用户和账户一对一
  # 一对一的情况下，有外键的一方使用 belongs_to
  belongs_to :account
end
