# PROBLEM: Write a method that takes a positive integer or zero, and converts it to a string representation
# Rules:  - You may not use any of the standard conversion methods available
# EXAMPLES: integer_to_string(4321) == '4321'
# D: input: positive integer or 0
#    output: string
# A:  - use a NUMBERS 'dictionary' for comparing the digits of the integer with
#       string characters. Initialize this using inverted dictionary from prev ex.
#     - initialize a blank string
#     - create an array digits_ary, by calling #digits method on int
#     - create a loop,
#         -  while digits_ary.size > 0
#         -  pop digits_ary, comparing returned element with 'dictionary'
#         -  add returned value to string via concat (<<)
#      - return string

NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}
NUMBERS = NUMBERS.invert

def integer_to_string(int)
  str = ''
  digits_ary = int.digits
  loop do
    str << NUMBERS[digits_ary.pop]
    break if digits_ary.size.zero?
  end
  str
end