# The Fibonacci series is a sequence of numbers starting with 1 and 1 where each
# number is the sum of the two previous numbers. So, the 3rd Fibonacci number is
# 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on.
# In mathematical terms:
#
# F(1) = 1
# F(2) = 1
# F(n) = F(n - 1) + F(n - 2) where n > 2
#
# This simple sequence can easily be computed using a "recursive" method. A
# recursive method is one in which the method calls itself. For example:
#
# def sum(n)
#   return 1 if n == 1
#   n + sum(n - 1)
# end
#
# is a recursive method to compute the sum of all integers between 1 and n. A
# good recursive method has 3 main qualities:
#
# * it calls itself at least once
# * it has an ending condition (if n == 1 above)
# * the results of each recursion are used in each step (n + sum(n - 1) uses
# sum(n - 1).
#
# Write a recursive method that computes the nth Fibonacci number, where nth is
# an argument to the method.
#
# Note: This exercise is primarily meant as a lead-in for the next two
# exercises. It verges on the Advanced level of exercises, so don't be
# discouraged if you can't do it on your own; recursion is tricky, and even
# experienced developers can have difficulty dealing with it.

def fib(n)
  n > 2 ? (fib(n - 1) + fib(n - 2)) : 1
end

fib(1)