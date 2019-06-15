# PROBLEM:
=begin
Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one the number of characters that are uppercase letters, and
one the number of characters that are neither.
=end
# Rules:

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: hash

# ALGORITHM - lower = size of the result of a select method using matchdata [a-z]
#           - upper = size of the result of a select method using matchdata [A-Z]
#           - neither = size of the result of a select method using matchdata [^a-z]i 
#           - define hash with values from above

# CODE:
def letter_case_count(str)
  lower = str.chars.select{|char| char.match?(/[a-z]/)}.size
  upper = str.chars.select{|char| char.match?(/[A-Z]/)}.size
  neither = str.chars.select{|char| char.match?(/[^A-Z]/i)}.size
  hash = {lower: lower, upper: upper, neither: neither}
end
p letter_case_count('abCdef 123') # => { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef')   # => { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123')        # => { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('')           # => { lowercase: 0, uppercase: 0, neither: 0 }