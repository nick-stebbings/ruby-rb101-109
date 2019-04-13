# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# - print all EVEN numbers in the range 1..99, one number per line

# Examples

# Data structures
# - input: 
# - output: 

# Algorithm
# - initialize counter variable
# - Loop: - puts the counter
#         - break if the counter gets to 98
#         - increment the counter

# Code
=begin FIRST VERSION:
counter = 2
loop do
  puts counter
  break if counter == 98
  counter += 2
end
=end
# SECOND VERSION:
array = (1..99).to_a.select {|x| x.even?}
puts array
