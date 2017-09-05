require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # presence: true 字段为空的对象不会被存入数据库
  # valid? 方法触发数据验证
  # 对象没有错误返回 true
  # 对象有错误返回 false
  # 对象保存到数据库之前会自动触发 valid? 验证
  def test_presence
    assert(User.create(name: "John Doe").valid?)
    assert_not(User.create.valid?)
    assert_not(User.create(name: nil).valid?)
  end

  # 实例方法 new_record? 判断对象是否已经存入数据库
  # 未存入数据库返回 true
  # 存入数据库返回 false
  def test_new_record?
    user = User.new(name: "John Doe")
    assert(user.new_record?)
    user.save
    assert_not(user.new_record?)
  end

  # Active Record 执行验证后，发现的所有错误都可以通过 errors.messages 方法获取
  # 如果数据验证后，这个集合为空，说明对象是有效的
  def test_errors_messages
    user = User.new
    assert_equal({}, user.errors.messages)

    user.valid?
    assert_equal({name: ["can't be blank"]}, user.errors.messages)

    user = User.create
    assert_equal({name: ["can't be blank"]}, user.errors.messages)

    assert_not(user.save)
  end

  # invalid? 和 valid? 是完全相反的，触发数据验证
  # 找到错误就返回 true
  # 未找到错误返回 false
  def test_invalid
    assert(User.new.invalid?)
    assert(User.new(name: nil).invalid?)
    assert_not(User.new(name: "John Doe").invalid?)
  end

  # 检查某个具体的属性是否有错误
  # object.errors[:attribute]
  # 验证的错误会以数组的形式返回，没有错误返回一个空数组
  # 但是这个方法必须在对象触发验证之后才有效，没触发之前无论是否有错误，都会返回一个空数组
  def test_errors
    user = User.new
    assert_equal([], user.errors[:name])

    user.invalid?
    assert_equal(["can't be blank"], user.errors[:name])
  end

  # 查看是哪个具体验证导致属性无效的
  # object.errors.details[:attribute]
  # 触发方式和 errors[:attribute] 是一样的
  def test_errors_details
    user = User.new(name: "John Doe")
    user.invalid?
    assert_equal([], user.errors.details[:name])

    user.name = nil
    user.invalid?
    assert_equal([{error: :blank}], user.errors.details[:name])
  end

  # inclusion 检测属性的值在集合中
  # exclusion 检测属性的值不在集合中
  def test_inclusion_and_exclusion
    user = User.create(name: "John Doe", sex: "Lala")
    assert_equal(["inclusion: Lala >_<", "exclusion: Lala >_<"], user.errors[:sex])
    assert_equal([{error: :inclusion, value: "Lala"}, {error: :exclusion, value: "Lala"}], user.errors.details[:sex])
  end

  def test_length
    user = User.create(name: "John Doe", telphone: 123456)
    assert_equal(["is too short (minimum is 11 characters)",
      "is too short (minimum is 11 characters)",
      "is the wrong length (should be 11 characters)"],
      user.errors[:telphone])
  end
end
