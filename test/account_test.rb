require 'test/unit'
require_relative '../account'

class Account_Test < Test::Unit::TestCase
    
    # Should format the string date input to a Time object
    def test_date_str_to_time
        user = Account.new
        assert_equal( Time.new(2018, 11, 11), user.date_str_to_time('11/11/18') )
    end

    # Should return an array for trans_date, trans_acc, and trans_value entered
    def test_create_transaction
        user = Account.new
        assert_equal([Time.new(2018, 11, 11), 'Rent', 50.0 ], user.create_transaction('11/11/18', 'Rent', 50.0))
    end
    
    # Should return the history of transactions for a selected account
    def test_account_history
        
    end

    # Should return the summed total of transactions in an account
    def test_account_total
        

    end

    # Should return Account Name, and account totals for each month?
    def test_balance_sheet
        
    end
end