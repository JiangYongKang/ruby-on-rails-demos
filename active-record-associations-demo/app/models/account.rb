class Account < ApplicationRecord
  # 账户和用户一对一关联
  # 一对一关联的情况下，没有外键的一方用 has_one
  has_one :user

  # 账户和角色多对多关联
  has_many :accounts_roles
  has_many :roles, through: :accounts_roles

  # 直接建立多对多的关联，不借助第三个模型，当不需要使用联结表的模型时，采用这种方法
  # has_and_belongs_to_many :roles
end
