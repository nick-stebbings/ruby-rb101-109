# Write a method that returns a list of all substrings of a string that start at
# the beginning of the original string. The return value should be arranged in
# order from shortest to longest substring.
#EXAMPLES:
# p substrings_at_start('abc')   # => ['a', 'ab', 'abc']
# p substrings_at_start('a')     # => ['a']
# p substrings_at_start('xyzzy') # => ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: ary

# ALGORITHM - convert to ary
#           - each_with_object on the ary
#           - concat the element with those preceding it, join, then add to memo 
#           - sort_by length

# CODE:
def substrings_at_start(str)
  results = []
  str.chars.each_index { |idx| results << str[0..idx] }
  results
end
def substrings_at_start1(str)
  chars = str.chars
  chars.each_with_object([]).with_index { |(_,memo), idx| memo << chars.take(idx+1).join('').to_s }
end
p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']