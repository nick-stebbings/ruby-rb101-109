=begin
Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed in to this method. 
# Rules: You may not use Array#reverse or Array#reverse!.
# The return value should be the same Array object.
# i.e. Can use the assignent method, which is non-mutating with respect to enclosing array, on individual elements. Need to satisfy list.object_id == result.object_id (from below) so mutating methods w.r.t. the array are a no go.
#EXAMPLES:
list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id
list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
list == ["e", "d", "c", "b", "a"]
list = ['abc']
reverse!(list) # => ["abc"]
list == ["abc"]
list = []
reverse!([]) # => []
list == []
=end

# DATA STRUCTURES:
#     -  INPUT: ary
#     - OUTPUT: ary

# ALGORITHM - create a blank 'holding' array.
#           - iterate through original array, pushing the object refereneced by arr[-1]
#               - this will leave you with a copy of arr with items reversed
#           - now iterate through arr and reassign each element to the corresponding array element in hold_arr
#           - return ary
# CODE:
def reverse!(arr)
  n = arr.length/2
  (1..n).each do |i|
    arr[i-1], arr[-i] = arr[-i], arr[i-1]
  end
  arr
end
list = %w(a b e d c)
p reverse!(list) #== ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]

list = ['abc']
p reverse!(list) #== ["abc"]
p list == ["abc"]

list = []
p reverse!(list) #== []
p list == []