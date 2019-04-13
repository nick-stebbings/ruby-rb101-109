arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
#  without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1
arr.map do|inner_hsh|
  inc_hsh = {}
  inner_hsh.each{|key, val| inc_hsh[key] = val + 1}
  inc_hsh
end