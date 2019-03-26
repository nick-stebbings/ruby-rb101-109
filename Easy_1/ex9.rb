# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# - write a method
# - take one argument, a positive integer, as input
# - return a positive integer, the sum of its digits
# - try doing it without while,until,loop or each

# Examples

# Data structures
# - input: int
# - output: int

# Algorithm
# - make a variable x that is the sum
# - convert int to string (always a valid positive integer anyway)
# - use string.length.times method instead of 'forbidden methods', invoke following block:
#   - use string.chr.to_i methods to take the first digit as int
#   - add to x
#   - remove the first character from string

# Code (FIRST ATTEMPT)
def sum(int)
  x = 0
  str = int.to_s
  p str.chr.to_i
  str.length.times do 
    x += str.chr.to_i
  end
  x
end

# This solution is a dead end, as the logic of using .times to avoid using other loops did not end up working (didn't think it through enough). The to_s idea was, however the right path, as implemented belows. 

def sum_take_2(int)
  int.to_s.chars.map {|x| x.to_i}.reduce(:+)
end

puts sum_take_2(23)
puts sum_take_2(496)
puts sum_take_2(123_456_789)