require_relative 'ui'

class Account
    def initialize
        @interface = UI.new
    end

    # Reads stored user data from a text file
    def get_account_data
        begin
            @user_data = JSON.parse( File.read( 'user_data.txt' ), :symbolize_names => true )
        rescue
            @user_data = {}
        end
    end

    # Writes user data to a text file
    def set_account_data
        File.write( 'user_data.txt', JSON.dump( @user_data ) )
    end

    # Converts date string to a Time object
    def date_str_to_time(date_str)
        Time.new('20' + date_str[6..7], date_str[3..4], date_str[0..1])
    end

    # Creates a transaction entry
    def create_transaction( trans_date, trans_account, trans_value )
        date = date_str_to_time(trans_date)
        transaction =[]
        transaction.push( date, trans_account, trans_value )
    end

end