# Write a method that takes an Array of integers as input, multiplies all of the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places.
#EXAMPLES:
# show_multiplicative_average([3, 5])
# => The result is 7.500
#show_multiplicative_average([2, 5, 7, 11, 13, 17])
# => The result is 28361.667

# DATA STRUCTURES:
#     -  INPUT: array
#     - OUTPUT: float to 3 d.p.

# ALGORITHM - reduce(:*)
#           - / by array length
#           - string format with %<num>.3d

# CODE:
def show_multiplicative_average(arr)
  format("%.3f", (arr.reduce(:*).to_f / arr.size))
end
p show_multiplicative_average([3, 5])
p show_multiplicative_average([2, 5, 7, 11, 13, 17])