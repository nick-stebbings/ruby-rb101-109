['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# counts the number of elements for which the block returns true. this will output 2