require 'test_helper'
require 'a_b_c'

class ExtensionsToArrayTest < ActiveSupport::TestCase

  test "class_attribute" do
    # 类中出现的 class_attribute 方法可以声明一个或多个可被继承的类属性（注意：不是实例属性，以下的测试都没有使用 "new" 关键字）
    # 修改当前类的属性，当前类和当前类的子类的属性值全部被修改
    A.x = 100
    assert_equal(A.x, 100)
    assert_equal(B.x, 100)
    assert_equal(C.x, 100)

    A.x = 200
    assert_equal(A.x, 200)
    assert_equal(B.x, 200)
    assert_equal(C.x, 200)

    B.x = 300
    assert_equal(A.x, 200)
    assert_equal(B.x, 300)
    assert_equal(C.x, 300)

    C.x = 400
    assert_equal(A.x, 200)
    assert_equal(B.x, 300)
    assert_equal(C.x, 400)

    # 类属性不仅可以直接通过类名调用，可以以从实例对象上访问或者赋值。
    # 相当于 Java 中的成员方法 + 静态方法的结合
    A.x = 100

    a1 = A.new
    a2 = A.new
    assert_equal(a1.x, 100)
    assert_equal(a2.x, 100)

    a1.x = 200
    assert_equal(a1.x, 200)
    assert_equal(a2.x, 100)

    # .x? 方法判断类方法是否存在
    a1 = A.new
    assert(A.x?)
    assert(a1.x?)

    a1.x = nil
    assert_not(a1.x?)
  end
end