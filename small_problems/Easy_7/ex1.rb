# PROBLEM:
=begin
Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the
elements taken in alternation.
=end
# Rules: You may assume that both input Arrays are non-empty, and that they have the same
# number of elements.

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: two arrays
#     - OUTPUT: ary

# ALGORITHM - push each first item onto a blank array n/2 times

# CODE:
def interleave(ary1, ary2)
  ary = []
  while !ary1.empty?
    ary.push(ary1.shift)
    ary.push(ary2.shift)
  end
  ary
end
def interleave(a1, a2)
  a1.zip(a2).flatten
end
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']