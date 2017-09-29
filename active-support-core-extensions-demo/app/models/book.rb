class Book < ApplicationRecord
  # 为原有的方法设定别名，book_name 是新的属性名，name 是旧的属性名
  alias_attribute :book_name, :name
end
