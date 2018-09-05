# This is where out main program will run
# require appropriate files here
require_relative 'ui'
require_relative 'account'

# run code...
app = UI.new
app.message( "Welcomne to the Ledger App!" )
# Much of the rest of the app can be run within the Account object
user = Account.new

app.message( "Thankyou for using the Ledger App!" )