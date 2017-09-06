require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  # 数字字段的相关验证
  def test_numericality
    order = Order.new(no: "No.0001", total: nil, count: nil)
    order.invalid?
    assert_equal(["is not a number"], order.errors[:total])
    assert_equal(["is not a number"], order.errors[:count])

    order.total = 10
    order.count = 10
    order.invalid?
    assert_equal([], order.errors[:total])
    assert_equal([], order.errors[:count])

    order.count = 10.1
    order.invalid?
    assert_equal(["must be an integer"], order.errors[:count])
  end
end
