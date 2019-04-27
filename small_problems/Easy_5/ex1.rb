# PROBLEM:Create a method that determines and returns the ASCII string value of a string that is passed in as an argument. That is - the sum of the results of String#ord on each character of a given string.
# EXAMPLES: ascii_value('Four score') == 984
# DATA STRUCTURES: input: string. Output: integer
# ALGORITHM:  - use chars to get an array of the character in the string
#             - map each character into a new array, calling #ord on each
#             - reduce the mapped array using +
#             - output the result.
def ascii_value(str)
  ascii_values = str.chars.map{|char| char.ord}
  (str == '') ? 0 : ascii_values.reduce(:+)
end
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0