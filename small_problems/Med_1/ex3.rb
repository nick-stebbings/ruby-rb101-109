# PROBLEM:
# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and rotate again to
# get 321597. Finally, keep the first 4 digits fixed in place and rotate the
# final 2 digits to get 321579. The resulting number is called the maximum
# rotation of the original number.
# Rules:
# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# rotate_rightmost_digits method from the previous exercise.

#EXAMPLES:
=begin
p max_rotation(735291)        # => 321579
p max_rotation(3)             # => 3
p max_rotation(35)            # => 53
p max_rotation(105)           # => 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) # => 7_321_609_845
# DATA STRUCTURES:
#     -  INPUT: int
#     - OUTPUT: int

# ALGORITHM - reminder: rotate ary moves the first element to the end
#                       - rotate rightmost digits rotates the sub_ary of the last n digits

#                    - /convert integer to string, then chars array
#                     - rotate the rightmost digits where n = the ary size
#                     - rotate the subarray of digits from 1..-1, prepend the element you excluded to reform ary
#                     - rotate the subarray of digits from 2..-2, prepend the elements you excluded to reform ary
#                     - continue in this pattern until the subarray has length 1, i.e. you are on the last element

=end
# CODE:
def rotate_array(ary)
  return ary if ary.nil?
  ary[1..-1] << ary[0]
end
def rotate_rightmost_digits_str(num, n)
  num_ary = num.chars
  take_amount = (num_ary.size >= n) ? num_ary.size - n : 0
  num_ary = num_ary.take(take_amount) << rotate_array(num_ary[-n..-1])
  num_ary.join
end
def max_rotation(num)
  num_ary = num.to_s.chars
  sub_ary_size = n = num_ary.size
  
  while sub_ary_size > 1 do
    diff = n - sub_ary_size
    sub_ary = num_ary[diff..-1]
    num_ary = num_ary - sub_ary + rotate_rightmost_digits_str(sub_ary.join, n-diff).chars
    sub_ary_size -= 1
  end
  num_ary.join.to_i
end
p max_rotation(735291)        # => 321579
p max_rotation(3)             # => 3
p max_rotation(35)            # => 53
p max_rotation(105)           # => 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) # => 7_321_609_845
p max_rotation(8_703_000_146) # => 7_321_609_845