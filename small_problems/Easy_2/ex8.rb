# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# UNDERSTAND THE PROBLEM:
# - Create a program that either sums or multiplies the range of values between 1 and the user inputted integer

# Examples:
# See question

# Data structures:
# - INPUT: string (validate and convert to int), string (accept either case)
# - OUTPUT: string

# Algorithm:
# - Ask the user for a positive integer, assign this to 'value'
# - Ask whether they want the sum or product, assign this to 'operation'
# - Use a formula to calculate the sum or product of the range
# - Format the answer into a string, and output

# Code:

def prompt(message)
  puts "=> #{message}"
end
def is_pos_int?(input)
  (input.to_i.to_s == input) && (input.to_i > 0)
end
int_value = nil
operation = nil

loop do
  prompt "Please enter an integer greater than 0"
  int_value = gets.chomp
  break if is_pos_int?(int_value)
  prompt "Please try again to enter a positive integer"
end

loop do
  prompt "Please enter an operation - add (a) or multiply (m)"
  operation = gets.chomp
  break if operation.match(/[aAmM]/)
  prompt "Please try again to enter a valid operation (a/m)"
end

range = (1..int_value.to_i)
answer = operation.match(/[aA]/) ? range.reduce(:+) : range.reduce(:*)
op_str = operation.match(/[aA]/) ? 'sum' : 'product'

puts "The #{op_str} of numbers from 1 to #{int_value} is #{answer}."