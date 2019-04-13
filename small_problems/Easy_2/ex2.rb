# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# Ask for two dimensions, use them to calculate and display the area of a room
# - Input: length in metres, width in metres (both float)
# - Output: area in square feet (float), area in square metres (float)
# - We are given the fact that 1 square meter == 10.7639 square feet
# - No validation is necessary

# Examples
#Enter the length of the room in meters:
#10
#Enter the width of the room in meters:
#7
#The area of the room is 70.0 square meters (753.47 square feet).

# Data structures
# - input: two strings that need converting to_f
# - output: a string that is interpolated description of calculations

# Algorithm
# - ask for input using gets.chomp
# - assign the user input to two separate variables
# - reassign the variable values to_f in preparation for calculation
# - perform calculation using given formula to get both outputs
# - create string variable that is interpolated using both outputs
# - puts this string to the user 

# Code
puts "Enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area_in_metric = length * width
area_in_sqft = area_in_metric * 10.7639
puts "The area of the room is #{area_in_metric} square meters (#{area_in_sqft} square feet)"