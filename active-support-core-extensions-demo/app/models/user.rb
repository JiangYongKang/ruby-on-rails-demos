class User < ApplicationRecord
  has_one :account

  # 方法委托，将关联对象 account 中的 email 属性委托给 user 对象中的 email 方法
  delegate :email, to: :account
  
  # 设定 allow_nil 后，原本报 NoMethodError 错误的情况下，不会报错，只会返回 nil
  delegate :password, to: :account, allow_nil: true
  
  # 设定 prefix，为方法名统一添加前缀。原本 user.telephone 方法名修改为 user.info_telephone
  delegate :telephone, to: :account, prefix: :info
end
