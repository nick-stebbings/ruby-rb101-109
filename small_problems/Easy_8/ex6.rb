# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers between the two
# numbers, except..
# Rules: if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
# print "FizzBuzz".

#EXAMPLES:
# fizzbuzz(1, 15)
# => 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# DATA STRUCTURES:
#     -  INPUT: two ints
#     - OUTPUT: print as above
# ALGORITHM - 
#           -
#           -
#           -

# CODE:
def fizzbuzz(a,b)
  arr = (a..b).to_a.map! do |num|
    case
    when num % 3 == 0
      (num % 5 == 0) ? 'FizzBuzz' : 'Fizz'
    when num % 5 == 0
      'Buzz'
      else
      num
    end
  end
  puts arr.join(", ")
end
fizzbuzz(1, 15)