class AccountsRole < ApplicationRecord
  # 联结表和用户、角色都是一对一的关系
  belongs_to :account
  belongs_to :role
end
