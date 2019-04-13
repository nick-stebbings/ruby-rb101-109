# PROBLEM:Create a method that takes an array as argument and returns the odd numbered elements in a new array
# EXAMPLES: See question
# DATA STRUCTURES: Input & output: both an array
# ALGORITHM:  - select the original array based on even indexes
=begin FIRST WAY:
(In order to make this work for even numbers, use .odd instead of .even)
def oddities(arr)
  arr.select {|item| arr.index(item).even?}
end
SECOND WAY:
def oddities(arr)
  arr_new = []
  for item in arr
    index = arr.index(item)
    arr_new << item if index.even?
  end
  arr_new
end
THIRD WAY:
=end
def oddities(arr)
  new_arr = []
  arr.each_with_index {|item, i| new_arr << item if i.even?}
  new_arr
end
p oddities([1,2,3,4,5])
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []