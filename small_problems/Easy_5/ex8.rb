# PROBLEM:
# Write a method that takes an Array of Integers between 0 and 19, and returns an
# Array of those Integers sorted based on the English words for each number
# EXAMPLES:
=begin
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end
# DATA STRUCTURES:
#     -  INPUT: array
#     - OUTPUT: array

# ALGORITHM - create array of written numbers as a constant
#           - map each number of input array to its corresponding word
#             - sort this array alphabetically
#               - map this sorted array back to it's corresponding integer
#           - return the final array

# CODE:
NUMBERS_IN_WORDS = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)

def alphabetic_number_sort(arr)
  arr.map{|num| NUMBERS_IN_WORDS[num]}.sort.map{|word| NUMBERS_IN_WORDS.index(word)}
end
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
# FURTHER EXPLORATION:
# Rewrite your method to use Enumerable#sort
# ALGO: - it actually already does!
#       - I shall try to rewrite using sort_by instead
def alphabetic_number_sort_2(arr)
  arr.sort_by{|element| NUMBERS_IN_WORDS[element]}
end
p alphabetic_number_sort_2((0..19).to_a)