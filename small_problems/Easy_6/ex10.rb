=begin
Write a method that takes a positive integer, n, as an argument, and displays a
right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left of
the triangle, and the other end at the upper-right.

#EXAMPLES:
triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********
=end
STAR = '*'
SPACE = ' '
def triangle(n, ccw_rotations = 3, mirrorx = true)
  triange = (1..n).each_with_object([]) do |i, res|
    stars = i
    spaces = n-i
    res << (STAR * stars) + (SPACE * spaces)
  end
  ccw_rotations.times do
    triange = triange.map { |line| line.split('') }.transpose.reverse.map(&:join)
  end
  puts mirrorx ? triange.map(&:reverse) : triange
end

# DATA STRUCTURES:
#     -  INPUT: integer
#     - OUTPUT: string (N.B. could have been an array for a simpler solution - remember this for multiline string problems.)

# ALGORITHM - create a string for the first line with n-1 spaces and 1 star
#           - create a blank string for the accumulation of lines
#           - n-1 times do
#             - first_line[-counter] = ' '
#             - lines << "/n" + first_line
#           - puts lines
# CODE: (first attempt)
def triangle2(n)
  first_line = '*'
  (n-1).times do
    first_line.prepend(' ')
  end
  lines = ''
  lines += first_line
  i = 1
  loop do
    first_line[-1-i] = '*'
    lines << "\n#{first_line}"
    i += 1
    break if i == n 
  end
  puts lines
end

triangle(3)
triangle(5)
triangle(9)