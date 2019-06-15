# Write a method that takes a positive integer as an argument and returns that
# number with its digits reversed.
def reversed_number(int)
  int.digits.join.to_i
end

puts reversed_number(12345) # => 54321
puts reversed_number(12213) # => 31221
puts reversed_number(456)   # => 654
puts reversed_number(12000) # => 21 # Note that zeros get dropped!
puts reversed_number(1)     # => 1