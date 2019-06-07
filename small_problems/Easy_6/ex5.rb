=begin
Write a method that takes an Array, and returns a new Array with the elements of
the original list in reverse order. Do not modify the original list.
# Rules: You may not use Array#reverse or Array#reverse!, nor may you use the method you
wrote in the previous exercise.

EXAMPLES:
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b c d e)) == %w(e d c b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true
list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true
=end

# DATA STRUCTURES:
#     -  INPUT: ary
#     - OUTPUT: new_ary

# ALGORITHM - THE LAST EXERCISE I ACCIDENTALLY HALF DID THIS PROBLEM :S OOPS
# CODE:
def reverse(arr)
  hold_arr = []
  if arr == hold_arr then return arr end
  i = 0
  loop do
    hold_arr.unshift(arr[i])
    i += 1
    break if i == arr.length
  end
  hold_arr
end
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
p list = [1, 2, 3]                      # => [1, 2, 3]
p new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true

# FURTHER EXPLORATION:
=begin
An even shorter solution is possible by using either inject or each_with_object.
Just for fun, read about these methods in the Enumerable module documentation,
and try using one in your reverse method.

def reverse(arr)
  arr.each_with_object([]){ |element, ary| ary.unshift element}
end

def reverse(arr)
  new_arr = arr.reduce([]){ |memo, element| memo.unshift(element) }
  new_arr
end
=end