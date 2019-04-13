['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# the return value is the original object, which by now is mutated to be a => ant, b=>bear, c=>cat