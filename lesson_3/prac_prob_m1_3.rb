def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end
p factors(1)
p factors(3)
p factors(9)
p factors(0)
p factors(-1)
  
# Bonus 1: this line checks to see if the number will divide without a remainder, i.e. if it is a factor.
# Bonus 2: this line is the one that gives a return value to the function.