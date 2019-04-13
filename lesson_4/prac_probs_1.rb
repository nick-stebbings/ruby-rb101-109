[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# return value is the same as the original array since 'hi' is always truthy