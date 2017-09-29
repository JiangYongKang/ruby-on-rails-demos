module CATTR_READER_WRITER_ACCESSOR
  class Base
    # cattr_reader cattr_writer cattr_accessor
    # attr_reader  attr_writer  attr_accessor
    # 两者的命名非常像，只不过前者是创建 "类方法"。后者创建的是 "实例方法"。
    cattr_accessor :value,
    
    # instance_reader instance_writer instance_accessor 设置为 false 可以不生成读写方法
    instance_reader:   true,
    instance_writer:   true,
    instance_accessor: true

    # 自动创建的 "类方法" 初始值为 nil。这里赋初值，以免空指针。
    self.value = 0
  end
end