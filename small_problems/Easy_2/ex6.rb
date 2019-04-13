# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# - print all ODD numbers in the range 1..99, one number per line

# Examples

# Data structures
# - input: 
# - output: 

# Algorithm
# - initialize counter variable
# - Loop: - puts the counter
#         - break if the counter gets to 99
#         - increment the counter

# Code
=begin FIRST VERSION:
counter = 1
loop do
  puts counter
  break if counter == 99
  counter += 2
end
=end
# SECOND VERSION:
(1..99).each {|x| if (x % 2 == 1) then puts x end}

