require 'test_helper'
require 'parent'

class ExtensionsToModuleTest < ActiveSupport::TestCase
  
  test "alias_attribute" do
    assert(Book.all)
    assert(Book.first.book_name, Book.first.name)
  end
  
  # TODO: attr_internal_reader, attr_internal_writer, attr_internal_accessor
  
  test "parent" do
    assert(X::Y::Z)

    assert_equal(X::Y, X::Y::Z.parent)
    assert_equal("X::Y", X::Y::Z.parent_name)

    assert_equal(X.parent, Object) # 顶层 module 的 parent 返回的是 object
    assert_nil(X.parent_name)      # 顶层 module 的 parent_name 返回的是 nil

    assert_equal([X::Y, X, Object], X::Y::Z.parents) # parents 返回的是一个数组
  end
  
  # TODO: 可达性
  # TODO: 匿名

  test "delegate" do
    assert(UserService.new.user_first.email)
    assert_equal(UserService.new.user_first.email, UserService.new.user_first.account.email)
    assert_equal(UserService.new.user_first.password, UserService.new.user_first.account.password)
    assert_equal(UserService.new.user_first.info_telephone, UserService.new.user_first.account.telephone)
  end
end