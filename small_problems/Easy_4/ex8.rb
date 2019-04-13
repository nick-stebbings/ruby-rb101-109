# PROBLEM: Write a method that takes a String of digits, and returns the appropriate number as an integer. 
# rules: -  The String may have a leading + or - sign; 
#          - if the first character is a +, your method should return a positive num #          - if it is a -, your method should return a negative number
#          - If no sign is given, you should return a positive number.
#          - You may assume the string will always contain a valid number.
#          - Don't use any of the standard conversion methods available in Ruby
#          - You may, however, use the string_to_integer method from ex6
# EXAMPLES: See question
# DATA STRUCTURES: input: positive/negative integer as string
#                  output: positive/negative integer
# ALGORITHM:   - intialize int variable as 0
#              - Use String[0] to ascertain whether + or - is present
#               - if it is, assign to 'sign' var
#               - perform string_to_integer on the remaining string, assign to x
#              - use conditional, 
#                   - if sign matches +, int = 0 + x
#                   - if sign matches -, int = 0 - x
#                   - if no sign was present, int = 0 + x
#              - return result
NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15}
def string_to_integer(str)
  int = 0
  arr = str.reverse.split('')
  arr.each_with_index do |chr, idx|
    int += NUMBERS[chr]*(10**idx)
  end
  int
end
def has_sign?(str)
  str[0] == '+' || str[0] == '-'
end

def string_to_signed_integer(str)
  int = 0
  numbers_as_int = string_to_integer( has_sign?(str) ? str[1..str.size] : str )
  case str[0]
    when '-'
      int -= numbers_as_int
    else
      int += numbers_as_int
  end
end

p string_to_signed_integer('4321')
p string_to_signed_integer('-570')
p string_to_signed_integer('+100')