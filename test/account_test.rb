require 'test/unit'
require_relative '../account'

class Account_Test < Test::Unit::TestCase
    def test_create_transaction
        user = Account.new
        assert_equal(['11/11/18', 'Rent', 50.0 ], user.create_transaction('11/11/18', 'Rent', 50.0))
    end
end