require 'test_helper'

class ExtensionsToHashTest < ActiveSupport::TestCase

  # 将 hash 对象转换为 xml 字符串
  test "to_xml" do
    hash = { x: 1, y: 2, z: 3 }
    xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <x type=\"integer\">1</x>\n  <y type=\"integer\">2</y>\n  <z type=\"integer\">3</z>\n</hash>\n"
    assert_equal(xml, hash.to_xml)
  end

  # 合并两个 hash
  test "merge" do
    hash = { x: 1, y: 2, z: 3 }
    assert_equal({ x: 100, y: 200, z: 3, i: 0 }, hash.merge({ x: 100, y: 200, i: 0 }))
  end

  test "except" do
    hash = { x: 1, y: 2, z: 3 }
    assert_equal({ x: 1, y: 2 }, hash.except(:z))

    # with_indifferent_access 会忽略键的类型进行删除，但是返回的 hash 的键是字符串类型，而不是符号类型
    assert_equal({ "x" => 1, "y" => 2 }, hash.with_indifferent_access.except(:z))
    assert_equal({ "x" => 1, "y" => 2 }, hash.with_indifferent_access.except("z"))
  end

  # 迭代处理值
  test "transform_values" do
    hash = { x: nil, y: 2, z: :a}
    assert_equal({ x: "", y: "2", z: "A"}, hash.transform_values { |value| value.to_s.upcase })
  end

  # 返回 hash 的切片
  test "slice" do
    hash = { x: 1, y: 2, z: 3 }
    assert_equal({ x: 1, y: 2 }, hash.slice(:x, :y))
    # 不存在的键会被忽略
    assert_equal({ x: 1, y: 2 }, hash.slice(:x, :y, :i))
  end

  # 删除并返回匹配指定键的键值对
  test "extract" do
    hash = { x: 1, y: 2, z: 3 }
    assert_equal({ x: 1 }, hash.extract!(:x))
    assert_equal({ y: 2, z: 3}, hash)
  end

  # 返回没有 nil 值的散列
  test "compact" do
    hash = { x: 1, y: 2, z: 3, i: nil }
    assert_equal({ x: 1, y: 2, z: 3 }, hash.compact)
  end
end
