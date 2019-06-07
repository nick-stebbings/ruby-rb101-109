# PROBLEM:
# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character.
# EXAMPLES:
=begin
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
=end
# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: string

# ALGORITHM - use chars to create an array of characters
#           - use each_with_index to iterate through array
#              - daisy chain reject method on array to reject when a character is the same as previous
#           - join returned array and output

# CODE:
=begin
def crunch(string)
  array = []
  for char in string.chars
    array << char unless (array.last == char)
  end
  array.join('')
end
def crunch(string)
  string.length == 1 ? string : string.chars.select.with_index{ |char, idx| (char != string[idx+1]) }.join('')
end
=end
def crunch(str)
  str.scan(/((\w)\2*)/).map { |group| group.first[0] }.join
end
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') =='g'
p crunch('a') == 'a'
p crunch('') == ''