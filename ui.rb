require 'terminal-table'
require 'colorize'


class UI

    # Clears screen and inseerts cursor at top left of console
    def start_line
        puts "\e[H\e[2J"
    end

    # Inserts a blank line in the console
    def empty_line
        puts "\n"
    end

    # Takes a prompt statement, which is output to the console, waits for user input, and then returns the input
    def prompt(input)
        input = input.strip
            print (input + ': ').colorize(:cyan)
        return gets.chomp
    end

    # Takes an array, which is output to the top of the console as a multi-line menu. Then waits for user input to select an option from the menu
    def menu(array)
        start_line
        for line in array
            puts line.capitalize.colorize(:cyan)
        end
        empty_line
        return gets.chomp        
    end

    # Takes input which is output to the top of the console for 3 seconds before disappearing
    def message(input)
        start_line
        puts input.colorize(:cyan)
        sleep(2)
    end

    # Takes input which is formatted into a readable list and output to the cosole
    def list(input)
        puts input.colorize(:cyan)
        empty_line
    end

    #Takes input for the content of table headings, and rows, and formats a table which is output to the console
    # rows must be an array of arrays, headings must be an array
    def table(rows, headings = [])

        new_table = Terminal::Table.new
        
        unless headings == []
            new_table.headings = headings
        end

        new_table.rows = rows

        new_table.style = { :width => 150,
            :border_x => '='.colorize(:cyan), 
                            :border_y => '|'.colorize(:cyan),
                            :border_i => ':'.colorize(:cyan)}
        for column_no in 0...new_table.columns.length
            new_table.align_column(column_no, :center)
        end
        
        puts empty_line
        puts new_table
        prompt('Press "Enter" key to continue')
    end

end

# app = UI.new
# app.table( [['11/11/18', '$100.00'], ['18/11/18', '$100.00']], [ 'Date of Transaction', 'Amount' ] )