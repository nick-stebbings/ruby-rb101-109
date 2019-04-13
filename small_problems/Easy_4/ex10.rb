# PROBLEM: Write a method that takes an integer, and returns the appropriate number as a string representation. 
# rules: -  The integer may have a leading + or - sign; 
#          - You may assume the integer will always contain a valid number.
#          - Don't use any of the standard conversion methods available in Ruby
#          - You may, however, use the integer_to_string method from ex9
#          - If there is no sign, assume the int is positive and add one (from ex.)
#          - If the number is 0, don't add a sign
# EXAMPLES: signed_integer_to_string(4321) == '+4321'
# DATA STRUCTURES: input: positive/negative integer
#                  output: positive/negative integer as string
# ALGORITHM:   - initialize a blank string
#              - use case statement to test whether
#                - int is 0?, then str = '0'
#                - a sign is present currently (<0)?
#                  - if no then str = +
#                  - if yes then str = -
#                - append integer_to_string(int) to str
#                - return str
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end
def signed_integer_to_string(int)
  case
    when int == 0
      puts integer_to_string(int)
    when int < 0
      puts "-#{integer_to_string(-int)}"
    when int > 0
      puts "+#{integer_to_string(int)}"
  end
end

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'