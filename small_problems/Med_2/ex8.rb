# PROBLEM:
# A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each. So, for example, 49
# is a featured number, but 98 is not (it is not odd), 97 is not (it is not a
# multiple of 7), and 133 is not (the digit 3 appears twice).
#
# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument.

# Rules: ODD && (%7 ==0) && (DIGITS == DIGITS.UNIQ)
# Issue an error message if there is no next featured number.

#EXAMPLES: below

# DATA STRUCTURES:
#     -  INPUT: integer
#     - OUTPUT: integer (featured number greater than input)

# ALGORITHM - 1. iniitialise nil variable for featured num
#           - 2. while variable = nil,
#               - integer = integer + 1
#               - is integer featured?
#                 - YES -  ODD && (%7 ==0) && (DIGITS == DIGITS.UNIQ), return
#                 - NO - keep going
# Do this recursively? Set base case is return error message (featured-num = false
# Maybe since above 10million it's impossible.. 
# - Base case is an error. 
# - If not an error then then increment index and feed back. 
# - When index = 9_999_999_999 then set featured_num == false (by default it's true)

# Iteratively? When do you stop? Start by iterating through odd multiples of 7 and see a pattern.
# 7, 21, 35, 49, 63, 77... from here the last digit is the same (either 7,1,5,9,3) 
# Above 9_999_999_999 it will always repeat, so just need to iterate til then

# CODE:
def featured(n)
  for num in ((n+1)...10_000_000_000) do
    (return num) if num.odd? && (num % 7 == 0) && (num.digits.uniq == num.digits)
  end
  "Error"
end

puts featured(12)          # => 21
puts featured(20)          # => 21
puts featured(21)          # => 35
puts featured(997)         # => 1029
puts featured(1029)        # => 1043
puts featured(999_999)     # => 1_023_547
puts featured(999_999_987) # => 1_023_456_987

puts featured(9_999_999_999)
# => There is no possible number that fulfills those requirements