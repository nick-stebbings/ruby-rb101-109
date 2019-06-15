# Write a method that returns the next to last word in the String passed to it
# as an argument.
# Rules: Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.
#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: str
#     - OUTPUT: str

# CODE: 
=begin
def penultimate1(str)
  str.split[-2]
end
def penultimate(str)
  str.scan(/[A-Za-z]+(?=\s[A-Za-z.\?\!]+$)/)
end
puts penultimate('last word')               # => 'last'
puts penultimate('Launch School is great!') # => 'is'

# FURTHER EXPLORATION (middle word): question is needed explicitly
# Need to consider where the 'middle' is when the size of the (array of words) is even. Could define it to be the n/2 nd element, or (n/2)-1 index
# Another edge case is when there are 0 or 1 elements. Propose you just return the original string in that case.
=end
def middle(str)
  words = str.split
  n = words.size
  case
  when (0..1).include?(n)
    return str
  when n.even?
    middle_ind = (n / 2) - 1
  else
    middle_ind = (n / 2)
  end
  words[middle_ind]
end
puts middle('last word')               # => 'last'
puts middle('Launch School is great!') # => 'School'
puts middle('Launch School is not great!') # => 'is'
puts middle('') # => ''
puts middle('is') # => 'is'