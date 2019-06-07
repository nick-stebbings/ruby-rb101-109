=begin
Write a method named include? that takes an Array and a search value as
arguments. This method should returns true if the search value is in the array,
false if it is not.
# Rules: You may not use the Array#include? method in your solution.

#EXAMPLES:
[3, 5, 6, 9].include?(3) == true
[3, 5, 6, 9].include?(19) == false
[].include?(19) == false
=end

# DATA STRUCTURES:
#     -  INPUT: ary, obj
#     - OUTPUT: boolean

# ALGORITHM - The obvious answer is #select, comparing the resulting array with != [] for the output of the method

# CODE:
def include?(ary, value)
  ary.select{ |obj| obj == value } != []
end
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false