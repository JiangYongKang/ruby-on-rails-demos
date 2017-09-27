require "active_support"
require "active_support/core_ext/object/blank" # 仅仅加载 blank 方法
require "active_support/core_ext/object"       # 加载 object 对象的全部扩展
require "active_support/core_ext"              # 加载全部核心方法
require "active_support/all"                   # 加载 support 提供的所有功能(并不会把整个 Active Support 载入内存，有些功能通过 autoload 加载，所以真正使用时才会加载。)

# config.active_support.bare = true 
# 这样设置后 rails 会加载 active support 提供的全部功能

class SingleSupport
  def initialize(x, y)
    @x = x
    @y = y
  end
end
