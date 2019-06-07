# PROBLEM:
# Given a string that consists of some words and an assortment of non-alphabetic
# characters, write a method that returns that string with all of the
# non-alphabetic characters replaced by spaces.
# Rules: If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
# (the result should never have consecutive spaces).
# EXAMPLES:
# cleanup("---what's my +*& line?") == ' what s my line '
# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: string

# ALGORITHM - check if contains non-AN using match (or .include? on a set of letters & numbers)
#             - if true
#               - replace each stubstring of these characters with a 
#             - if false return string

# CODE:
def cleanup(str)
    str.chars.map {|char| char.match(/[A-Za-z0-9]/) ? char : ' ' }.join.squeeze(" ")
end
p cleanup('this&*^is NOT9&* funny')
p cleanup('this is funny')
p cleanup('$£^%@{{@}}')
p cleanup(' ')
p cleanup("---what's my +*& line?") == ' what s my line '

# FURTHER EXPLORATION:
# If you originally wrote this method with regular expressions, try writing it
# without regular expressions.
# ALGO: - create an array of AN character then use second suggestion on above algorithm for matching (include?)
# CODE:
LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a
def cleanup2(str)
  str.chars.map {|char| LETTERS.include?(char) ? char : ' ' }.join.squeeze(" ")
end
p cleanup2('this&*^is NOT9&* funny')
p cleanup2('this is funny')
p cleanup2('$£^%@{{@}}')
p cleanup2(' ')
p cleanup2("---what's my +*& line?") == ' what s my line '