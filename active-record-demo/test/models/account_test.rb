require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def test_account
    account = accounts(:account_1)
    assert_equal(account, Account.find(account.id))
  end

  def test_account_user
    account = accounts(:account_1)
    assert_equal(account.user, Account.find(account.id).user)
  end
end
