class Dept < ApplicationRecord
  # 部门和用户多对一
  has_many :users
end
