# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# Write a method
# - takes one argument, an array containing integers
# - returns the average of all numbers in the array
# - array never empty, always full of positive integers

# Examples
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Data structures
# - input: array
# - output: positive integer

# Algorithm
# - create a variable x that is to be a sum of the numbers
# - assign x = ary.sum
# - divide x by ary.length
# - output x

# Code

def average(ary)
  x = ary.sum.to_f/ary.length
end
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
#test the float rule
puts average([1,2])