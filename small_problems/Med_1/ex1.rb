# PROBLEM:
# Write a method that rotates an array by moving the first element to the end of
# the array. The original array should not be modified.
# Rules:  Do not use the method Array#rotate or Array#rotate! for your implementation.

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: ary
#     - OUTPUT: new_ary

# ALGORITHM - new_ary = ary. dup
#             - pop.new_array.shift
#           -
#           -
#           -

# CODE:
def rotate_array(ary)
  ary[1..-1] << ary[0]
end
def rotate_array_1(ary)
  new_ary = ary.dup
  new_ary << new_ary.shift
end
p rotate_array([7, 3, 5, 2, 9, 1]) # => [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c'])    # => ['b', 'c', 'a']
p rotate_array(['a'])              # => ['a']
x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]  # => true
puts x == [1, 2, 3, 4]                # => true

def rotate_string(str)
  str[1..-1] += str[0]
end
def rotate_string_1(str)
  rotate_array(str.chars).join
end
# Write a method that rotates a string instead of an array.
puts rotate_string("!important") # => "important!"
puts rotate_string("hello")      # => "elloh"
puts rotate_string("h")          # => "h"
greeting = "Hey!"
puts rotate_string(greeting) == "ey!H"  # => true
puts greeting == "Hey!"                 # => true

# Write a method that rotates an integer instead of an array.
def rotate_integer(int)
  ans = int.to_s[1..-1] << int.to_s[0]
  ans.to_i
end
def rotate_integer_1(int)
  rotate_string(int.to_s).to_i
end
puts rotate_integer(9012345678) # => 123456789
puts rotate_integer(192837)     # => 928371
puts rotate_integer(1)          # => 1
number = 123
puts rotate_integer(number) == 231  # => true
puts number == 123                  # => true