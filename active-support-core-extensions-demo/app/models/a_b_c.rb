class A
  # 设置类方法
  # 添加 instance_reader: false 选项，设置类方法不可读，及时设置了 false。但是，对象实例的 .x? 方法依然可以使用。
  # 如果想彻底的屏蔽实例对象读取类方法，可以使用 instance_predicate: false 选项。
  class_attribute :x, instance_reader: true, instance_predicate: true
end

class B < A
end

class C < B
end

