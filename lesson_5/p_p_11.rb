arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3
arr.map {|sub_array| sub_array.reject do |element|
    (element % 3) > 0
  end}