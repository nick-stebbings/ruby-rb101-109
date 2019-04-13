# PROBLEM:Create a method that converts a string of digits to an integer
# EXAMPLES: string_to_integer('570') == 570
# DATA STRUCTURES: input: integer as string. output: int
# ALGORITHM: - split the string using delimiter ('') to get an array of character
#            - using NUMBERS constant (hash) as a reference, iterate through array
#              - if current element matches string key in NUMBERS
#              - then replace array element with numeric value corresponding to key
#            - add result of unit, tens, hundreds etc. to a new int variable
#              - use formula 10 * bigger unit + smaller unit. e.g. for 431
#              - 10* 4 (hundres) + 3 = 43
#              - 10*43 + 1 = int
#            - return int
#CODE:
NUMBERS = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15}

def string_to_integer(str)
  int = 0
  arr = str.reverse.split('')
  arr.each_with_index do |chr, idx|
    int += NUMBERS[chr]*(10**idx)
  end
  int
end
=begin
I ended up tweaking the algorithm so that the array was reversed and the 
formula was int += digit * ( 10 raised to the power of the index ).
It turned out to be very helpul in constructing the hex to int method.
FURTHER EXPLORATION:
It occured to me that you could make this a more general method 
to convert using binary also.
=end

def base_n_as_string_to_integer(num,n)
  int = 0
  arr = num.downcase.reverse.split('')
  arr.each_with_index do |chr, idx|
    int += NUMBERS[chr]*(n**idx)
  end
  int
end

p string_to_integer('4321') == 4321 # =>TRUE
p string_to_integer('570') == 570# =>TRUE

p base_n_as_string_to_integer('4D9f',16) == 19871 # =>TRUE
p base_n_as_string_to_integer('00000101',2) == 5 # =>TRUE
