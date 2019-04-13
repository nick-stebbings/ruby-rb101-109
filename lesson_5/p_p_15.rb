arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
#write some code to return an array which contains only the hashes where all the integers are even
p arr.select{|sub_hash|
  sub_hash.all? do |_, value|
    value.all? {|element| element.even?}
  end}