=begin
Write a method that takes an Array as an argument, and returns two Arrays that
contain the first half and second half of the original Array, respectively.
# Rules: If the original array contains an odd number of elements, the middle element should
be placed in the first half Array.

#EXAMPLES:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
=end

# DATA STRUCTURES:
#     -  INPUT: ary
#     - OUTPUT: two arys

# ALGORITHM - length = ary.length
#           - initialise ary2 as empty
#             - length/2 times, pop from ary1 to ary2
#                - since integer division will give the right number of pops, this is all that's needed
#           - return ary of arys

# CODE:
def halvsies(ary)
  length = ary.size
  ary2 = []
  (length / 2).times{ ary2.unshift(ary.pop) }
  results = [ary, ary2]
end
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]