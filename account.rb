require 'json'
require_relative 'ui'
require_relative 'err'

class Account
    def initialize
        @interface = UI.new
        @user_data = get_account_data

        # output menu of options on initialisation
        options_menu
    end

    # Reads stored user data from a text file
    def get_account_data
        begin
            JSON.parse( File.read( 'user_data.txt' ), :symbolize_names => true )
        rescue
            []
        end

    end

    # Writes user data to a text file
    def set_account_data
        File.write( 'user_data.txt', JSON.dump( @user_data ) )

    end

    # Gives user options for how to use their account
    def options_menu
        menu_choice = ''
        while menu_choice != 'exit'
            menu_choice = @interface.menu( ['What would you like to do today?', 'Enter "1" to enter a new transaction', 'Enter "2" to view the history for an account', 'Enter "3" to see the balance sheet for all accounts', 'Or enter "exit" to exit the app'] )

        case menu_choice
            when '1'
                transaction_data_input

            when '2'
                account = @interface.prompt('Which account would you like to view history for?')
                @interface.table( account_history( account, @user_data), [ 'Date of Transaction', 'Amount' ] )

            when '3'
                @interface.table( balance_sheet(@user_data) )

            when 'exit'
                return

            else
                @interface.message( "Sorry, your selection was invalid" )
            
            end
        end

    end

    # Prompts user for data to be used to create transaction data
    def transaction_data_input
        @trans_date = @interface.prompt('Please enter the date of the transaction (as dd/mm/yy)')
        @trans_account = @interface.prompt('Please enter an account for the transacion').capitalize
        @trans_value = @interface.prompt('Please enter the value of the transaction $' )
        store_transaction
        @interface.message('You have successfully entered your transaction.')
    end

    # # Converts date string to a Time object
    # def date_str_to_time(date_str)
    #     Time.new('20' + date_str[6..7], date_str[3..4], date_str[0..1])

    # end

    # Creates a transaction entry
    def create_transaction( trans_date, trans_account, trans_value )
        { date: trans_date, account: trans_account, value: trans_value }

    end

    # Stores transaction in @user_data array
    def store_transaction
        @user_data.push(create_transaction(@trans_date, @trans_account, @trans_value))
        set_account_data

    end

    # Retrieves history of transactions for an account
    def account_history(account, user_data)
        history = []
        user_data.select { |trans| trans[:account] == account }.each do |selection|
            history << [ selection[:date], "$#{'%.2f' % selection[:value]}" ]
        end 
        history
        
    end

    def account_total(account, user_data)
        total = 0
        account_name = user_data.select { |trans| trans[:account] == account }
        account_name.each do |selection|
            total += selection[:value].to_f
        end 

        "$#{'%.2f' % total}"

    end

    # Balance sheet
    def balance_sheet(user_data)
        accounts = []
        for transaction in user_data
            accounts << transaction[:account]
        end
        unique_accounts = accounts.uniq

        balances = []
        for account in unique_accounts
            account_value = account_total(account, user_data)
            balances << [ account, account_value]
        end

        balances

    end


    def exit_app
        exit
    end




end