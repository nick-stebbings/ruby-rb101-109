arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
 #without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.
new_hsh = {}
arr.each do |sub_ary|
  new_hsh[sub_ary[0]] = sub_ary[1]
end