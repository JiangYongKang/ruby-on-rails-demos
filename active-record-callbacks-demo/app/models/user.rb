class User < ApplicationRecord
  validates :name, :email, presence: true

  # 对象初始化的回调方法，无论是自己创建的对象还是从数据库加载出来的对象
  after_initialize do |user|
    logger.info("You have initialized an #{user} object!")
  end

  # 从数据库加载记录的回调方法（无论是 find 方法还是其他的像 where 方法，凡是从数据库加载出来数据，都会触发该回调）
  after_find do |user|
    logger.info("You have found an #{user} object!")
  end

  # 当我们在 Active Record 对象上调用 touch 方法时，会调用 after_touch 回调。
  after_touch do |user|
    logger.info("You have touched an #{user} object")
  end

  # 对象保存之前触发回调
  # => User.create(name: "Vincent", email: "vincent4502237@gmail.com")
  before_create do
    logger.info("user before_create callback")
  end

  # 验证之前触发的回调
  # => User.create
  before_validation :ensure_login_has_a_value

  # 验证之后触发的回调，通过 :on 选项指定一个或多个具体的生命周期事件
  # => User.create
  after_validation :display_user, on: [:create, :update]

  private
    def ensure_login_has_a_value
      logger.info("user before_validation callback")
    end

    def display_user
      logger.info("user detail: [name: #{self.name}, email: #{self.name}, telphone: #{self.telphone}, sex: #{self.sex}, age: #{self.age}]")
    end
end
