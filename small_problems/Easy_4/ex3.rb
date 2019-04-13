# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# UNDERSTAND THE PROBLEM:
# - Write a method that takes any year greater than 0, returns a true or false 
# - indicating if the input is a leap year.
#RULES:
#In the modern era under the Gregorian Calendar, leap years occur in every year #that is evenly divisible by 4, unless the year is also divisible by 100. If the #year is evenly divisible by 100, then it is not a leap year unless the year is #evenly divisible by 400.

# Examples:
=begin
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
=end

# Data structures:
# - INPUT: integer (valid year > 0)
# - OUTPUT: boolean

# Algorithm:
#
#
#

# Code:

def leap_year?(year)
  if (year % 400 == 0)
    true 
  elsif (year % 100 != 0) && (year % 4 == 0)
    true
  else 
    false
  end
end
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true