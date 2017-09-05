class User < ApplicationRecord
  # name 的非空检查(nil, "", " ")
  validates :name, presence: true

  # 检查属性的值是否在指定集合中
  validates :sex, inclusion: { in: ["M", "F"], message: "inclusion: %{value} >_<", allow_nil: true }

  # 检查属性的值是否不在指定的集合中
  validates :sex, exclusion: { in: ["Gay", "Lala"], message: "exclusion: %{value} >_<", allow_nil: true }

  # 验证属性值的长度
  # allow_nil: true 表示如果字段为空，就不执行验证
  validates :telphone, length: { minimum: 11, allow_nil: true }  # 最小长度
  validates :telphone, length: { maximum: 11, allow_nil: true }  # 最大长度
  validates :telphone, length: { in: 11..11, allow_nil: true }   # 长度区间
  validates :telphone, length: { is: 11, allow_nil: true }       # 长度
end
