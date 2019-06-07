# PROBLEM:
=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such
that the first 2 numbers are 1 by definition, and each subsequent number is the
sum of the two previous numbers. This series appears throughout the natural
world.
Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it
takes 6 iterations to enter the 2 digit numbers.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument. 

# Rules:(The first Fibonacci number has index 1.)
#   - what about f(0)?, f(1)? Assume a positive integer is given. If num = 1, return 1
#EXAMPLES:
find_fibonacci_index_by_length(2) == 7
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
=end
# DATA STRUCTURES:
#     -  INPUT: integer
#     - OUTPUT: integer

# ALGORITHM - create fibonacci array
#                 - initialise array as [1,1]
#                 - array.push(array[-1]+array[-2])
#                 - break if above.length == len
#           - return index of fib number (array length)

# CODE:
def find_fibonacci_index_by_length(len)
  return len if len == 1
  fib_arr = [1,1]
  while fib_arr[-1].to_s.length < len do
    fib_arr.push(fib_arr[-1] + fib_arr[-2])
  end
  fib_arr.length
end
p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
p find_fibonacci_index_by_length(1) == 1