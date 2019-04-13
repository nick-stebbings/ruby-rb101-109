# PROBLEM:Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.
# EXAMPLES: running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# DATA STRUCTURES: input + output are arrays of the same length
# ALGORITHM:  - Use each_with_index to append to a blank array
#               - for each value, append to blank_array the value + blank_array
=begin
def running_total(arr)
  new_arr = []
    arr.each_with_index do |value, index|
      index == 0 ? new_arr << value : new_arr << (value + new_arr[index-1])
    end
  new_arr
=end
def running_total(arr)
  new_arr = []
  arr.inject(0) do |sum, element| 
    new_arr << (sum + element)
    sum + element
  end
  new_arr
end
p running_total([2, 5, 13])
p running_total([14, 11, 7, 15, 20]) 
p running_total([3]) == [3]
p running_total([]) == []

