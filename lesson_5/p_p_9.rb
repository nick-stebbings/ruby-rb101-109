arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
# return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr.map do |v|
  v.sort{|a, b| b <=> a}
end
