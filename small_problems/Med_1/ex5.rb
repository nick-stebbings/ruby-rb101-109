# PROBLEM:
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is
# an odd integer that is supplied as an argument to the method. 
# Rules: You may assume that the argument will always be an odd integer.

#EXAMPLES:
#diamond(1)
# *
=begin
#diamond(3)
 *
***
 *

#diamond(5)
  *
 ***
*****
 ***
  *

#diamond(9)
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
=end
# DATA STRUCTURES:
#     -  INPUT: odd int
#     - OUTPUT: array of strings, puts'd

# ALGORITHM - construct an array of length n
#           - up to (n/2), the ary contains (2idx+ 1) stars preceded by n/2-idx spaces
#           - from -(n/2) to -1, ary element (can be the same as its index -1(e.g. -3 is same as 2) 

# CODE:

def diamond(n, hollow = true)
  output = diamond_lines_first_half(n, hollow)
  ((n/2)-1).downto(0) do |i|
    output << output[i]
  end
  puts output
end

def diamond_lines_first_half(n, hollow)
  half = n/2
  (0..half).each_with_object([]) do |i, output|
    line = ' '
    if hollow
      (half-i).times{line += ' '}
      line += '*'
      ((2*i)-1).times{line += ' '}
      line += '*' unless i.zero?
    else
      ((n/2)-i).times{line += ' '}
      ((2*i)+1).times{line += '*'}
    end
    output << line
  end
end

diamond(3, false)
diamond(6)
diamond(9)
# FURTHER EXPLORATION: Modify it so it shows only the outline of the diamond.
