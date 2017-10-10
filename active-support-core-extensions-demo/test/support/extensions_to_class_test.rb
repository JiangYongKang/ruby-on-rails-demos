require 'test_helper'

class ExtensionsToArrayTest < ActiveSupport::TestCase

  test "class_attribute" do
    # 类中出现的 class_attribute 方法可以声明一个或多个可被继承的类属性（注意：不是实例属性，以下的测试都没有使用 "new" 关键字）
    # 修改当前类的属性，当前类和当前类的子类的属性值全部被修改
    CLASS_ATTRIBUTE::A.x = 100
    assert_equal(CLASS_ATTRIBUTE::A.x, 100)
    assert_equal(CLASS_ATTRIBUTE::B.x, 100)
    assert_equal(CLASS_ATTRIBUTE::C.x, 100)

    CLASS_ATTRIBUTE::A.x = 200
    assert_equal(CLASS_ATTRIBUTE::A.x, 200)
    assert_equal(CLASS_ATTRIBUTE::B.x, 200)
    assert_equal(CLASS_ATTRIBUTE::C.x, 200)

    CLASS_ATTRIBUTE::B.x = 300
    assert_equal(CLASS_ATTRIBUTE::A.x, 200)
    assert_equal(CLASS_ATTRIBUTE::B.x, 300)
    assert_equal(CLASS_ATTRIBUTE::C.x, 300)

    CLASS_ATTRIBUTE::C.x = 400
    assert_equal(CLASS_ATTRIBUTE::A.x, 200)
    assert_equal(CLASS_ATTRIBUTE::B.x, 300)
    assert_equal(CLASS_ATTRIBUTE::C.x, 400)

    # 类属性不仅可以直接通过类名调用，可以以从实例对象上访问或者赋值。
    # 相当于 Java 中的成员方法 + 静态方法的结合
    CLASS_ATTRIBUTE::A.x = 100

    a1 = CLASS_ATTRIBUTE::A.new
    a2 = CLASS_ATTRIBUTE::A.new
    assert_equal(a1.x, 100)
    assert_equal(a2.x, 100)

    a1.x = 200
    assert_equal(a1.x, 200)
    assert_equal(a2.x, 100)

    # .x? 方法判断类方法是否存在
    a1 = CLASS_ATTRIBUTE::A.new
    assert(CLASS_ATTRIBUTE::A.x?)
    assert(a1.x?)

    a1.x = nil
    assert_not(a1.x?)
  end

  test "subclasses" do
    # .subclasses 方法返回当前类的子类（并不会返回子类的子类）
    assert_equal(SUBCLASSES::A.subclasses, [SUBCLASSES::B])
    assert_equal(SUBCLASSES::B.subclasses, [SUBCLASSES::C1, SUBCLASSES::C2])
    assert_equal(SUBCLASSES::C1.subclasses, [])
    assert_equal(SUBCLASSES::C2.subclasses, [])
  end

  test "descendants" do
    # .descendants 方法返回类的子类（子类的子类也会返回）
    assert_equal(DESCENDANTS::A.subclasses, [DESCENDANTS::B])
    assert_equal(DESCENDANTS::B.subclasses, [DESCENDANTS::C1, DESCENDANTS::C2])
    assert_equal(DESCENDANTS::C1.subclasses, [])
    assert_equal(DESCENDANTS::C2.subclasses, [])
  end

  test "cattr_reader_writer_accessor" do
    # cattr_reader cattr_writer catter_accessor 方法创建类方法和实例方法
    assert(CATTR_READER_WRITER_ACCESSOR::Base.value)

    assert_equal(CATTR_READER_WRITER_ACCESSOR::Base.value, CATTR_READER_WRITER_ACCESSOR::Base.value)
    assert_equal(CATTR_READER_WRITER_ACCESSOR::Base.new.value, CATTR_READER_WRITER_ACCESSOR::Base.new.value)

    base1 = CATTR_READER_WRITER_ACCESSOR::Base.new
    base2 = CATTR_READER_WRITER_ACCESSOR::Base.new

    base1.value = 100
    assert_equal(100, base1.value)
    assert_equal(100, base2.value)
    assert_equal(100, CATTR_READER_WRITER_ACCESSOR::Base.value)
    assert_equal(100, CATTR_READER_WRITER_ACCESSOR::Base.new.value)
  end
end
