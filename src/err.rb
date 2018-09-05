# Definition of errors or validation rules

# Regex arguments
class String

    # validates as an interger or float
    def is_numeric?
        /\A[+-]?\d+(\.\d+)?\z/ === self 
    end

    # validates as a date in format dd/mm/yy *Not perfect, but good enough
    def date_format?
        /\A[0-3][0-9]\/[0-1][0-9]\/[0-9]{2}\z/ === self
    end


end

class NonNumericArgumentError < StandardError

end

class IncorrectDateFormatError < StandardError

end