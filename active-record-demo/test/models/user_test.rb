require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_user
    user = users(:user_1)
    assert_equal(user, User.find(user.id))
  end

  def test_user_account
    user = users(:user_1)
    assert_equal(user.account, User.find(user.id).account)
  end
end
