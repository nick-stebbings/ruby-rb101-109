# PROBLEM:
# Bubble Sort is one of the simplest sorting algorithms available. It isn't an
# efficient algorithm, but it's a great exercise for student developers. In this
# exercise, you will write a method that does a bubble sort of an Array.
#
# A bubble sort works by making multiple passes (iterations) through the Array.
# On each pass, each pair of consecutive elements is compared. If the first of
# the two elements is greater than the second, then the two elements are
# swapped. This process is repeated until a complete pass is made without
# performing any swaps; at that point, the Array is completely sorted.
#
# 6	2	7	1	4	Start: compare 6 > 2? Yes
# 2	6	7	1	4	Exchange
# 2	6	7	1	4	6 > 7? No (no exchange)
# 2	6	7	1	4	7 > 1? Yes
# 2	6	1	7	4	Exchange
# 2	6	1	7	4	7 > 4? Yes
# 2	6	1	4	7	Exchange
# 2	6	1	4	7	2 > 6? No
# 2	6	1	4	7	6 > 1? Yes
# 2	1	6	4	7	Exchange
# 2	1	6	4	7	6 > 4? Yes
# 2	1	4	6	7	Exchange
# 2	1	4	6	7	6 > 7? No
# 2	1	4	6	7	2 > 1? Yes
# 1	2	4	6	7	Exchange
# 1	2	4	6	7	2 > 4? No
# 1	2	4	6	7	4 > 6? No
# 1	2	4	6	7	6 > 7? No
# 1	2	4	6	7	1 > 2? No
# 1	2	4	6	7	2 > 4? No
# 1	2	4	6	7	4 > 6? No
# 1	2	4	6	7	6 > 7? No
# 1	2	4	6	7	No swaps; all done; sorted
#
# We can stop iterating the first time we make a pass through the array without
# making any swaps; at that point, the entire Array is sorted.
#
# For further information, including pseudo-code that demonstrates the algorithm
# as well as a minor optimization technique, see the Bubble Sort wikipedia page.
#
# Write a method that takes an Array as an argument, and sorts that Array using
# the bubble sort algorithm as just described. Note that your sort will be
# "in-place"; that is, you will mutate the Array passed as an argument. You may
# assume that the Array contains at least 2 elements.

# Rules:

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: array
#     - OUTPUT: array (same)

# ALGORITHM - define n as the length of the array
#           - loop until your swapped variable is false
#             - initialise boolean for state (swapped = false)
#             - inner loop:
#               from 2nd element to the last (i = 1 until i = n-1)
#               - if A[i-1] > A[i] (they are in the wrong order)
#               - then swap the elements
#               -set swapped to true
#           - return the array
require 'pry'
# CODE:
def bubble_sort(arr)
  n = arr.size
  loop do
    newn = 0
    for i in (1..n-1)
      if arr[i-1] > arr[i]
        arr[i-1], arr[i] = arr[i], arr[i-1]
        newn = i
      end
    end
    n = newn
    break if newn <= 1
  end
  arr
end

def cocktail_sort(arr)
  n = arr.size
  loop do
    newn = 0
    newm = 0

    for i in (1..n-1)
      if arr[i-1] > arr[i]
        arr[i-1], arr[i] = arr[i], arr[i-1]
        newn = i
      end
    end
    n = newn
    break if newn <= 1
    n.pred.downto(newm) do |m|
      if arr[m] > arr[m-1]
        arr[m], arr[m-1] = arr[m-1], arr[m]
        newm = m
      end
    end
  end
  arr
end

require 'benchmark'
a = [1,2,3,5,4] * 10
b = [11,2,3,5,4] * 10
c = [1,0,3,5,4] * 10
d = [1,0,3,-1,4] * 10
arrays = [a,b,c,d]

puts Benchmark.measure {
  50.times do
    for array in arrays
      bubble_sort(array)
    end
  end
}
puts Benchmark.measure {
  50.times do
    for array in arrays
      cocktail_sort(array)
    end
  end
}
#  0.003452   0.000000   0.003452 (  0.003445) bubble
#  0.002080   0.000010   0.002090 (  0.002271) cocktail

