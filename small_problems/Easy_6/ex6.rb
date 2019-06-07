=begin
Write a method to that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays.
=end
# Rules:
#There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.
#Implicit - don't use the built in merge mthod
#EXAMPLES:
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# DATA STRUCTURES:
#     -  INPUT: two arys
#     - OUTPUT: new_ary

# ALGORITHM - initialise blank array
#           - call uniq on both arguments before using as arguments to remove duplicates
#           - for each argument (each_with_object would combine this step and the others!)
#             - loop through ary and add element to new_ary if it isn't already included
#            - return new_ary

# CODE:
def merge(ary_1, ary_2)
  ary_2.uniq.each_with_object(ary_1.uniq){ |element, merged| merged << element unless merged.include?(element) }
end
p merge([1, 3, 5], [3, 6, 9]) # => [1, 3, 5, 6, 9]