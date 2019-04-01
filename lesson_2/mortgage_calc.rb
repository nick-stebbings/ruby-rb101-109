=begin
# Problem
# Build a method
# - take 3 arguments as input: loan amount, APR, loan duration
# - calculate and return the monthly rate of payment
# - use given formula:

m = p * (j / (1 - (1 + j)**(-n)))
where...
m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

# - run code through Rubocop
# - CONSIDERATIONS:
#   -- take percentage as integer? then must convert to decimal
#   -- APR must be converted first to a monthly rate
#   -- Are we working with months or years? Consider var names
#   -- Initial data validation on amount (positive int), APR (>0), duration
# (positive int)

# Examples
# calc(amount=1000,percentAPR=5,duration_months=24) = 43.87
# calc(50000,1,48) = 1063.07
# calc(2300,15,1) = 2328.75
# calc(99,5,0.5) = (invalid - cannot currently accept half a month)

# Data structures
# - input: two integers and a float (APR)
# - output: float

# Algorithm
# - ask for user input, construct loop for validation
# - validate input
# - convert APR to decimal by dividing by 100
# - convert APR to monthly interest rate by dividing by 12
# - use formula to calculate monthly payment amount
# - relay it to the user

# Code
=end
require 'pry'

def calc_monthly_payment(amount, apr, duration)
  monthly_int = (apr / 100) / 12
  amount * (monthly_int / (1 - (1 + monthly_int)**-duration))
end

def valid_int?(int)
  int.to_s.to_i == int
end

puts "=> Welcome to the loan repayment calculator!"
puts "=> Please enter a loan amount in $:"
amount, length = nil
apr = 0.0

loop do
  amount = gets.chomp.to_i
  valid_int?(amount) && amount > 0 ? break \
    : (puts "=> Please enter a valid amount.")
end

puts "=> Please enter a loan APR in %:"

loop do
  apr = gets.chomp.to_f
  valid_int?(apr) && apr > 0 ? break \
    : (puts "=> Please enter a valid percentage.")
end

puts "=> Please enter a loan duration in months:"

loop do
  length = gets.chomp.to_i
  valid_int?(length) && length > 0 ? break \
    : (puts "=> Please enter a valid duration in months.")
end
puts "=> Calculating..."
sleep 1
puts calc_monthly_payment(amount, apr, length)
