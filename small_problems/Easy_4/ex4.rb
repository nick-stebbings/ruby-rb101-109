# PROBLEM:Create a method that, given a positive integer, computes the sum of all multiples of 3 and 5 between 1 and that number
# EXAMPLES: if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20
# DATA STRUCTURES: input: int. output: int
# ALGORITHM:  - create an empty array, 3_5_multiples
#             - create a loop
#               - for num in (1..int), if num%3==0 or num%5==0
#                 append current_num to 3_5_multiples                  
#             - reduce 3_5_multiples using + operator
#             - output the result
def multisum(int)
  multiples = []
  for num in (1..int)
    multiples << num if ((num % 3 == 0) | (num % 5 == 0))
  end
  multiples.inject(:+)
end
p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168