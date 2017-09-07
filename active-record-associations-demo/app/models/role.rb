class Role < ApplicationRecord
  # 角色和账户多对多关联
  has_many :accounts_roles
  has_many :accounts, through: :accounts_roles

  # 直接建立多对多的关联，不借助第三个模型，当不需要使用联结表的模型时，采用这种方法
  # has_and_belongs_to_many :accounts
end
