require 'test_helper'

class ExtensionsToRangeTest < ActiveSupport::TestCase

  test "to_s" do
    assert_equal("1..10", (1..10).to_s)
    assert_equal("BETWEEN '1' AND '10'", (1..10).to_s(:db))
  end

  # 测试参数指定的值域是否在接收者的范围内
  test "include?" do
    assert((1..10).include?(3..7))
    assert_not((1..10).include?(0..7))
    assert_not((1..10).include?(3..11))
    assert_not((1...9).include?(3..9))
  end

  # 测试两个值域是否有交集
  test "overlaps?" do
    assert((1..10).overlaps?(7..11))
    assert((1..10).overlaps?(0..7))
    assert_not((1..10).overlaps?(11..27))
  end

end
