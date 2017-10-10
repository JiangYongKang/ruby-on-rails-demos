require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# 加载 support 提供的全部功能，否则很多方法不可以使用
require 'active_support/all'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
