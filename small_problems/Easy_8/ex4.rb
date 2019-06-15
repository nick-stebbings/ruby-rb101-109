# Write a method that returns a list of all substrings of a string. The returned
# list should be ordered by where in the string the substring begins. This means
# that all substrings that start at position 0 should come first, then all
# substrings that start at position 1, and so on. Since multiple substrings will
# occur at each position, the substrings at a given position should be returned
# in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the
# previous exercise.
# Rules:

#EXAMPLES:
#p substrings('abcde') # => [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: array

# ALGORITHM - get an array using substrings_at_start for each element of the array
#           - concat and flatten

# CODE:
def substrings_at_start(str)
  chars = str.chars
  chars.each_with_object([]).with_index { |(el,memo), idx| memo << chars.take(idx+1).join('').to_s }
end

def substrings(str)
  (0..str.length-1).each_with_object([]) { |idx, memo| memo << substrings_at_start(str[idx..-1]) }.flatten
end
p substrings('abcde')