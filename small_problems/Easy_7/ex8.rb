# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.
#EXAMPLES:
# multiply_list([3, 5, 7], [9, 10, 11]) # => [27, 50, 77]
# DATA STRUCTURES:
#     -  INPUT: two arys
#     - OUTPUT: new ary

# ALGORITHM - initialise blank ary
#           - ary1.each_with_index
#             - new_ary << element * ary2[idx]

# CODE:
def multiply_list_1(ary1,ary2)
  ary1.each_with_object([]).with_index { |(el, result), idx | result[idx] = el * ary2[idx] }
end
def multiply_list(ary1, ary2)
  ary1.zip(ary2).map { |pair| pair.reduce(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) # => [27, 50, 77]
p multiply_list([14, 2, 71], [92, 0.1, -1]) # => [1288, 0.2, -71]