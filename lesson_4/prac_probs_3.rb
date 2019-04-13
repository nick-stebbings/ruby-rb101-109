[1, 2, 3].reject do |num|
  puts num
end
# reject is like the opposite of select, so it chooses based on the falsiness of the block. so this will output the original array since the return value of puts is nil.