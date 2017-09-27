require 'test_helper'

class ExtensionsToAllObjectsTest < ActiveSupport::TestCase
  
  test "blank" do
    assert("".blank?)
    assert(" ".blank?)
    assert_not(" x ".blank?)
    assert_not(User.first.blank?)
  end
  
  test "present" do
    # " ".present? 等价于 !" ".blank?
    assert(User.first.present?)
    assert(" x ".present?)
    assert_not("".present?)
    assert_not(" ".present?)
  end
  
  test "presence" do
    # " ".present? 返回的是布尔值。
    # " ".presence 返回的是 nil 或者调用对象的值。
    assert(User.first.presence)
    assert_not("".presence)
    assert_not(" ".presence)
    assert_nil("".presence)
    assert_equal(User.first.presence, User.first)
  end
  
  test "duplicable" do
    # 除了 nil、false、true、符号、数字、类、模块和方法对象之外，其他对象都可以复制。
    assert_equal(1.object_id, 1.object_id)
    assert_not(nil.duplicable?)
    assert_not(false.duplicable?)
    assert_not(true.duplicable?)
    assert_not(1.duplicable?)
  end

  test "deep_dup" do
    # 深拷贝对象
    array = ["x", "y", "z"]
    duplicate = array.deep_dup
    duplicate.first.gsub!('x', "*")
    assert_equal(array, ["x", "y", "z"])
    assert_equal(duplicate, ["*", "y", "z"])

    # 如果对象不可复制，deep_dup 方法直接返回对象本身
    number = 1
    duplicate = number.deep_dup
    assert_equal(number.object_id, duplicate.object_id)
  end

  test "try" do
    # .try 方法在对象为空的时候返回空，对象不为空的时候执行参数中的方法
    object = nil
    assert_nil(object.try("object_id"))
    
    # 上面的方法等同于:
    # unless object.nil?
    #   object.object_id 
    # end
    
    object = 100
    assert_equal(object.try("object_id"), 100.object_id)
  end

  test "strip" do
    # nil.strip throw error.
    assert_equal("".strip, "")
    assert_equal(" x ".strip, "x")
    assert_equal(" x y ".strip, "x y")
  end
end