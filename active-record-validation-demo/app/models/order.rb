class Order < ApplicationRecord

  # 检查属性的值是否只包含数字
  validates :total, numericality: true

  # only_integer 选项设为 true 只接受整数
  # greater_than 属性值必须比指定的值大
  # greater_than_or_equal_to 属性值必须大于或等于指定的值
  # equal_to 属性值必须等于指定的值
  # less_than 属性值必须比指定的值小
  # less_than_or_equal_to 属性值必须小于或等于指定的值
  # other_than 属性值必须与指定的值不同
  # odd 如果设为 true，属性值必须是奇数
  # even 如果设为 true，属性值必须是偶数
  validates :count, numericality: { only_integer: true }

  # on 选项指定什么时候验证
  validates :no, presence: true, on: :create
end
