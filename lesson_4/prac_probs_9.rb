{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# the return value of map is a hash of the same size, with the same key-value pairs where the value size is greater than 3. where it is not, the keys will have nil values.