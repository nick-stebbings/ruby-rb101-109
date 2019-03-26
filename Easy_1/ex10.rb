# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# -write a method
# - takes two arguments as input : +ve int, bool
# - calculates the bonus for a given salary using rules:
#    - If(bool) then bonus = salary/2
#    - Else bonus = 0
# Examples

# Data structures
# - input:  int, bool
# - output: int

# Algorithm
# - evaluate bool using if statement as defined in the problem
# - ternary operator would be suitable here

# Code
def calculate_bonus(salary,bool)
  bool ? salary/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000