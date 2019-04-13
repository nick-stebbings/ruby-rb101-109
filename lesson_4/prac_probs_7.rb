[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# the block's return value is a boolean based on whether the passed value is odd or not.
# the any? method returns a boolean value indicating if the block was true for any of the elements of the array