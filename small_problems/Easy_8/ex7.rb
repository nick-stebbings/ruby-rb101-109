# Write a method that takes a string, and returns a new string in which every
# character is doubled.
#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT:
#     - OUTPUT:

# ALGORITHM - 
#           -
#           -
#           -

# CODE:
def repeater1(str)
  str.chars.each_with_object([]) { |char, memo| memo << char << char }.join
end
def repeater(str)
  str.gsub(/(.)/, '\1\1')
end

puts repeater('Hello')     # => "HHeelllloo"
puts repeater("Good job!") # => "GGoooodd  jjoobb!!"
puts repeater('')          # => ''