# This is where out main program will run
# require appropriate files here
require_relative 'ui'
require_relative 'account'

# run code...
app = UI.new
app.message( "Welcomne to the Ledger App!" )
# Much of the rest of the app can be run within the Account object
user = Account.new

app.message( "Thank you for using the Ledger App!" )

# TO DO
# Confirm that amount entered for value is numerical with an error message
# Confirm that date entered is in correct fomat with regex and error message
# Find out if ther is a way to read time objects from json and refactor
# Sort history before sending to table by date (dependent on previous step)