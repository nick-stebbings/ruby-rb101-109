# PROBLEM:
    
# A triangle is classified as follows:
#
# * equilateral All 3 sides are of equal length
# * isosceles 2 sides are of equal length, while the 3rd is different
# * scalene All 3 sides are of different length
#
# To be a valid triangle, the sum of the lengths of the two shortest sides must
# be greater than the length of the longest side, and all sides must have
# lengths greater than 0: if either of these conditions is not satisfied, the
# triangle is invalid.
#
# Write a method that takes the lengths of the 3 sides of a triangle as
# arguments, and returns a symbol :equilateral, :isosceles, :scalene, or
# :invalid depending on whether the triangle is equilateral, isosceles, scalene,
# or invalid.
# Rules:
# Check if the triangle is valid, return a message if not. If it is, THEN return the symbol

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: 3 floats, (turn into an array)
#     - OUTPUT: symbol

# ALGORITHM - Check if the triangle is valid
#               - /  "the sum of the lengths of the two shortest sides must
#                   be greater than the length of the longest side, and all sides must have
#                   lengths greater than 0"
#                   -   turn into an array and sort the lengths. 
#                   -   if any are 0, return :invalid
#                   -   if array elements in first two positions reduce to a number > third element, continue. 
#                         - else return :invalid
#           - case when any two consecutive sides are equal, return :isoceles
#           - case when 3 consecutive sides are equal, return :equilateral
#           - else return :scalene

# CODE:
def triangle(a, b, c)
  lengths = [a,b,c].sort
  return :invalid if lengths.any? { |side| side == 0 } || lengths[0..1].sum <= lengths.max
  if lengths.each_cons(2).any? { |pair| pair[0] == pair [1] }
    lengths.uniq.size == 1 ? :equilateral : :isosceles
  else
    :scalene
  end
end
p triangle(3, 3, 3)   # => :equilateral
p triangle(3, 3, 1.5) # => :isosceles
p triangle(3, 4, 5)   # => :scalene
p triangle(0, 3, 3)   # => :invalid
p triangle(3, 1, 1)   # => :invalid