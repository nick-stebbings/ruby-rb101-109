# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the Array
# always contains at least one number.
#EXAMPLES:
=begin
puts sum_of_sums([3, 5, 2])
# => (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3])
# => (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4])
# => 4
puts sum_of_sums([1, 2, 3, 4, 5])
# => 35
=end
# DATA STRUCTURES:
#     -  INPUT: ary
#     - OUTPUT: number

# ALGORITHM - for n = 1.. length
#           - take(n).reduce(:+)
#           - sum all
require 'pry'
# CODE:
def sum_of_sums(ary)
  (1..ary.size).inject(0){ |sum, el| sum + ary.take(el).reduce(:+) }
end
puts sum_of_sums([3, 5, 2])
puts sum_of_sums([1, 5, 7, 3])
puts sum_of_sums([4])
puts sum_of_sums([1, 2, 3, 4, 5])