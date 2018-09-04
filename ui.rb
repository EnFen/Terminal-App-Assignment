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
            print (input.capitalize + ': ').colorize(:cyan)
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
        puts input.capitalize.colorize(:cyan)
        sleep(3)
    end

    # Takes input which is formatted into a readable list and output to the cosole
    def list(input)
        puts input.colorize(:cyan)
        empty_line
    end

    #Takes input for the content of table titles, headings, and rows, and formats a table which is output to the console
    def table(row_items_as_array_of_arrays, headings_as_array = [], title = nil)

        #Formats title; centred on one line, color = cyan #Note: terminal-table breaks when title is colorized
        unless !title
            title_table = Terminal::Table.new :rows => [[title]]
            title_table.style = {   :width => 120,
                                    :border_x => '='.colorize(:cyan), 
                                    :border_y => '|'.colorize(:cyan),
                                    :border_i => ':'.colorize(:cyan),
                                    :border_bottom => false }
            title_table.align_column(0, :center)
        end

        #Formats headings; right aligns 0th value, centres others, color = cyan
        unless headings_as_array == []
            headings_table = Terminal::Table.new :rows => [headings_as_array]
            headings_table.style = {   :width => 148,
                                    :border_x => '='.colorize(:cyan), 
                                    :border_y => '|'.colorize(:cyan),
                                    :border_i => ':'.colorize(:cyan),
                                    :border_bottom => false }
            headings_table.align_column(0, :right)
            headings_table.align_column(1, :center)
            headings_table.align_column(2, :center)
        end

        #Formats body content; right aligns 0th value, centres others, color = cyan
        body_table = Terminal::Table.new :rows => row_items_as_array_of_arrays
        body_table.style = {   :width => 148,
                                :border_x => '='.colorize(:cyan), 
                                :border_y => '|'.colorize(:cyan),
                                :border_i => ':'.colorize(:cyan) }
        body_table.align_column(0, :right)
        body_table.align_column(1, :center)
        body_table.align_column(2, :center)

        puts title_table
        puts headings_table
        puts body_table
    end

end