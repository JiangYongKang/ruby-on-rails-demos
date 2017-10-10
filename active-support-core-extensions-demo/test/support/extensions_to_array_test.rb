require 'test_helper'

class ExtensionsToArrayTest < ActiveSupport::TestCase

  # 返回 xml 格式的字符串
  test "to_xml" do
    # 所有元素都必须能响应 to_xml，否则抛出异常。
    assert_equal(["1", "2", "3"].to_xml, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<strings type=\"array\">\n  <string>1</string>\n  <string>2</string>\n  <string>3</string>\n</strings>\n")
    assert_equal({ "x": 1, "y": 2, "z": 3 }.to_xml, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <x type=\"integer\">1</x>\n  <y type=\"integer\">2</y>\n  <z type=\"integer\">3</z>\n</hash>\n")
  end

  # 参数为 nil 返回空数组
  # 参数为数组，返回本身
  # 其他情况返回参数的数组表示
  test "wrap" do
    assert_equal([], Array.wrap(nil))
    assert_equal([1, 2, 3], Array.wrap([1, 2, 3]))
    assert_not_equal([1, 2, 3].object_id, Array.wrap([1, 2, 3]).object_id)
    assert_equal([0], Array.wrap(0))
  end

  # 切分数组
  test "in_groups" do
    array = %w(1 2 3 4 5 6 7 8 9)

    # 指定切分数组大小
    assert_equal([["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]], array.in_groups(3))
    assert_equal([["1", "2", "3"], ["4", "5", nil], ["6", "7", nil], ["8", "9", nil]], array.in_groups(4))
    assert_equal([["1", "2"], ["3", "4"], ["5", "6"], ["7", "8"], ["9", nil]], array.in_groups(5))

    # 不填充
    assert_equal([["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]], array.in_groups(3, false))
    assert_equal([["1", "2", "3"], ["4", "5"], ["6", "7"], ["8", "9"]], array.in_groups(4, false))
    assert_equal([["1", "2"], ["3", "4"], ["5", "6"], ["7", "8"], ["9"]], array.in_groups(5, false))

    # 指定填充内容
    assert_equal([["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]], array.in_groups(3, '-'))
    assert_equal([["1", "2", "3"], ["4", "5", "-"], ["6", "7", "-"], ["8", "9", "-"]], array.in_groups(4, '-'))
    assert_equal([["1", "2"], ["3", "4"], ["5", "6"], ["7", "8"], ["9", "-"]], array.in_groups(5, '-'))
  end

  # 在指定分隔符处切分数组
  test "split" do
    array_1 = [1, '*', 2, '*', 3, '*', 4, '*', 5, 6]
    array_2 = [1, '*', 2, '*', '*', 3, '*', 4, '*', 5, 6]

    # 连续出现分隔符的地方会被创建成空数组
    assert_equal([[1], [2], [3], [4], [5, 6]], array_1.split('*'))
    assert_equal([[1], [2], [], [3], [4], [5, 6]], array_2.split('*'))
  end

end
