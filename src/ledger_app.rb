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
# Implement full CRUD functionality (at present, updating and deleting not possible)
# Find out if there is a way to read time objects from json and refactor
# Sort history before sending to table by date (dependent on previous step)