# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: string

# ALGORITHM - string.chars
#           - map for each element of chars array,
#             - if matches [a-z], upcase
#             - if matches [A-Z], downcase
#           - join

# CODE:
def swapcase(str)
  new = str.chars.map do |char|
    if char =~ /[a-z]/
      then char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  new.join
end
puts swapcase('CamelCase')          # => 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV')  # => 'tONIGHT ON xyz-tv'