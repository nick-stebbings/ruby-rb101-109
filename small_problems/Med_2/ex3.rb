# PROBLEM:
# In the easy exercises, we worked on a problem where we had to count the number
# of uppercase and lowercase characters, as well as characters that were neither
# of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase
# letters, and one the percentage of characters that are neither.

# Rules:  You may assume that the string will always contain at least one character.
# Implicit: calculate percentages to 1 d.p.
#           no need to parse escape characters (e.g. \n is 1 for neither, 1 lowercase)

#EXAMPLES:
# p letter_percentages('abCdef 123') # => { lowercase: 50, uppercase: 10, neither: 40 }
# p letter_percentages('AbCd +Ef')   # => { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# p letter_percentages('123')        # => { lowercase: 0, uppercase: 0, neither: 100 }
# p letter_percentages(' A')        # => { lowercase: 0, uppercase: 50, neither: 50 }
# p letter_percentages('ZAAHGFJHJHA')        # => { lowercase: 0, uppercase: 100, neither: 0 }
# p letter_percentages('jhhkjbk\nj')        # => { lowercase: 90, uppercase: 0, neither: 10 }

# DATA STRUCTURES:
#     -  INPUT: str, convert to ary
#     - OUTPUT: hash {percentage of lowercase: x, percentage of uppercase: y, % that are neither: z}

# ALGORITHM - split string into chars
#             - store the length of the array in a variable, 'length'
#           - count the selection of chars where char matches to /[a-z]/
#           - count the selection of chars where char matches to /[A-Z]/
#           - create a variable, 'neither', assign it to (length - the two counts above)
#           - calculate the percentages and round them to 1 d.p.
#           - output results as hash

# CODE:
def letter_percentages(str)
  length, chars = str.size, str.chars
  matches, counts = [%r([a-z]), %r([A-Z]), %r([^A-Za-z])], []
  for match in matches
    counts << (chars.select { |char| char =~ match }.count)
  end
  percentages = counts.map{ |count| (count/length.to_f  * 100).round(1) }
  [:lowercase, :uppercase, :neither].zip(percentages).to_h
end
p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')   # => { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123')        # => { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages(' A')        # => { lowercase: 0, uppercase: 50, neither: 50 }
p letter_percentages('ZAAHGFJHJHA')        # => { lowercase: 0, uppercase: 100, neither: 0 }
p letter_percentages('jhhkjbk\nj')        # => { lowercase: 90, uppercase: 0, neither: 10 }