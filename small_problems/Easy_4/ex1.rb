# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# UNDERSTAND THE PROBLEM:
# Create a method that takes two strings as arguments, decides which of the two strings is shorter, and then concactenates the strings like so: 
#shortstr+LONGSTR+shortst
# Rules: the strings are asssumed to be diffrent lengths
#        the output string must be of the format above
#        empty strings are allowed (implied from example)
# Examples:
# short_long_short('abc', 'defgh') == "abcdefghabc"

# Data structures:
# - INPUT: two strings
# - OUTPUT: one string

# Algorithm:
# - construct a loop for input
#     - validate that the inputs are both strings (using 'type'), break if true
#     - otherwise ask user for more input
# - compare length of string 1 with length of string 2
# - if str1.size > str2.size, out_string = str2+str1+str2
# - output out_string

# Code:
def prompt(message)
  puts "=> #{message}"
end


def ask_input
  str = ''
  loop do
    prompt "Please enter a string"
    str = gets.chomp
    break if (str.is_a? String)
    prompt "Please enter a valid string"
  end
  return str
end

def short_long_short(str1,str2)
  str1.size > str2.size ? str2 + str1 + str2 : str1 + str2 + str1
end

str1 = ask_input
str2 = ask_input
p short_long_short(str1,str2)