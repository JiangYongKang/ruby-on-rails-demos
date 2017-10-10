require 'test_helper'

class ExtensionsToRegexpTest < ActiveSupport::TestCase

  test "match?" do
    assert(/oo/.match?('foo'))
    assert_not(/oo/.match?('bar'))
    assert(/oo/.match?('foo', 1))
  end
end
