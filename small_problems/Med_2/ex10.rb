# PROBLEM:

# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n
# positive integers.

# Rules:

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: positive int
#     - OUTPUT:

# ALGORITHM - work out the sum of the first n integers using reduce(:+)
#           - square it and assign to variable
#           - use map and reduce to find the sum of squares, subtract one from the other and take modulus
#           -

# CODE:
def sum_square_diff(n)
  sq_of_sum = (1..n).to_a.sum ** 2
  sum_of_sq = (1..n).to_a.map{ |num| num *= num }.sum
  (sq_of_sum - sum_of_sq).abs
end

puts sum_square_diff(10)  # => 2640
puts sum_square_diff(1)   # => 0
puts sum_square_diff(100) # => 25164150