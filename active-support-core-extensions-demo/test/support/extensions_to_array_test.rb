require 'test_helper'

class ExtensionsToArrayTest < ActiveSupport::TestCase
  
  test "to_xml" do
    # 所有元素都必须能响应 to_xml，否则抛出异常。
    assert_equal(["1", "2", "3"].to_xml, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<strings type=\"array\">\n  <string>1</string>\n  <string>2</string>\n  <string>3</string>\n</strings>\n")
    assert_equal({ "x": 1, "y": 2, "z": 3 }.to_xml, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <x type=\"integer\">1</x>\n  <y type=\"integer\">2</y>\n  <z type=\"integer\">3</z>\n</hash>\n")
  end
  
end
