# PROBLEM:
# In the previous exercise, we developed a procedural method for computing the
# value of the nth Fibonacci numbers. This method was really fast, computing the
# 20899 digit 100,001st Fibonacci sequence almost instantly.
#
# In this exercise, you are going to compute a method that returns the last
# digit of the nth Fibonacci number.
# Rules: implicit - don't use the method from before (surely too easy)

#EXAMPLES:
=begin
puts fibonacci_last(15)        # => 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # => 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # => 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # => 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # => 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # => 4
=end
# DATA STRUCTURES:
#     -  INPUT:
#     - OUTPUT:

# ALGORITHM - 
#           -
#           -
#           -
  # fibonacci(number).to_s[-1].to_i
require 'pry'
# CODE:
def fibonacci_last_2(number)
  last_2 = [1, 1]
  3.upto(number) do
    last_2 = [last_2.last, (last_2.sum) % 10]
  end
  last_2.last
end

# F.E.:
# Based on the notion that the last digit is a recurring series with a frequency of 60...
LAST_DIGITS_SERIES = (1..60).to_a.map { |i| fibonacci_last_2(i) }

def fibonacci_last(number)
  LAST_DIGITS_SERIES[(number % 60)-1]
end

p fibonacci_last(9999)