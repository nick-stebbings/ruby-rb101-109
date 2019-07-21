# In the previous exercise, we developed a recursive solution to calculating the
# nth Fibonacci number. In a language that is not optimized for recursion, some
# (not all) recursive methods can be extremely slow and require massive
# quantities of memory and/or stack space.
#
# Ruby does a reasonably good job of handling recursion, but it isn't designed
# for heavy recursion; as a result, the Fibonacci solution is only useful up to
# about fibonacci(40). With higher values of nth, the recursive solution is
# impractical. (Our tail recursive solution did much better, but even that failed
# at around fibonacci(8200).)
#
# Fortunately, every recursive method can be rewritten as a non-recursive
# (procedural) method.
#
# Rewrite your recursive fibonacci method so that it computes its results
# without recursion.

# algorithm: n.times do 
#             - make a variable for current num (default 1)
#             - make a variable for last num (default 0)
#             - f(n) = current num + last num
#             - last num = current num
#             - current num = f(n)

def fib(n)
  current, last = 1, 0
  (2..n).each do
    last, current = current, current + last
  end
  puts current
end
fib(1)
fib(2)
fib(3)
fib(30)
fib(9999)