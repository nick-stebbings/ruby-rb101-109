# PROBLEM:
# Write a method that can rotate the last n digits of a number. For example:
# Note that rotating just 1 digit results in the original number being returned.
# Rules: You may use the rotate_array method from the previous exercise if you want.
# (Recommended!)

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: two ints
#     - OUTPUT: int

# ALGORITHM - run the subarray of num.chars[-n..-1] through the rotate method from before
#           - append it to num.chars.take(len-n)
#           -

# CODE:
def rotate_array(ary)
  ary[1..-1] << ary[0]
end
def rotate_rightmost_digits(num, n)
  num_ary = num.to_s.chars
  num_ary = num_ary.take(num_ary.size-n) << rotate_array(num_ary[-n..-1])
  num_ary.join.to_i
end
p rotate_rightmost_digits(735291, 1) # => 735291
p rotate_rightmost_digits(735291, 2) # => 735219
p rotate_rightmost_digits(735291, 3) # => 735912
p rotate_rightmost_digits(735291, 4) # => 732915
p rotate_rightmost_digits(735291, 5) # => 752913
p rotate_rightmost_digits(735291, 6) # => 352917