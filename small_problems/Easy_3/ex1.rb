# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# UNDERSTAND THE PROBLEM:
# A program that takes 6 numbers (assume integers +ve or -ve), then returns a
# message letting the user know if the 6th number was in the set of the first 5.
#

# Examples:
# See question

# Data structures:
# - INPUT: 6 strings (convert to integers)
# - OUTPUT: 1 string

# Algorithm:
# - create a prompt function
# - use the prompt to question the user 6 different times
#     - initialise an empty array num_arr
#     - initiate a loop, break unless num_arr.size = 5
#     - after each iteration, push returned integer (after validation) to num_arr
#     - the 6th integer will be assigned to a local variable, num 
#  - use the array#include method to see if num is in num_arr
#   - use a conditional to return the appropriate string

# Code:

def prompt(message)
  puts "=> #{message}"
end

def is_int?(input)
  input.to_i.to_s == input
end

num_arr = []
num = ''
loop do
  loop do
    prompt "Please enter a whole number:"
    num = gets.chomp
    break if is_int?(num)
    prompt "Please try again to enter a whole number"
  end
  num_arr.size == 5 ? break : num_arr << num.to_i
end
msg = num_arr.include?(num) ? " is" : " is not"
prompt "The last number #{num + msg} included in #{num_arr}"
 


