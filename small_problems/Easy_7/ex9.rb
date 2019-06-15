# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays. The
# results should be sorted by increasing value.
# Rules: You may assume that neither argument is an empty Array.
#EXAMPLES:
# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) # => [2, 4, 4, 6, 8, 8, 12, 16]
# DATA STRUCTURES:
#     -  INPUT: two arys
#     - OUTPUT: ary

# ALGORITHM - initialise blank ary results
#           - for each element of ary1 
#             - for each el in ary2 
#               - results << element * el
#           - return results

# CODE:
def multiply_all_pairs(ary1, ary2)
  results = []
  ary1.each do |a1_el|
    ary2.each do |a2_el|
      results << a1_el * a2_el
    end
  end
  results.sort
end
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]