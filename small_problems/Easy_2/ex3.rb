# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# Create a program that calculates a tip based on a bill amount and a percentage tip rate.
# INPUT : - assumed a float with 2 decimals representing dollar amount of bill
#         - an integer from 0 to 100 for the tip rate (assume validation needed)
# OUTPUT: - The amount of the tip, formatted in dollars
#         - The bill total, including the tip

# Examples 
=begin
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end

# Data structures
# - input: float and integer
# - output: two strings

# Algorithm
# - Ask the user for an input for the bill amount
# - Assign this to a variable
# - Ask the user for a tip percentage.
# - Convert to int and assign this to a variable
# - Use a formula (bill amount * percentage) to calculate tip.
# - Assign this to a variable
# - Create a string for each of the outputs and puts using interpolation

# Code
def prompt(message)
  puts "=> #{message}"
end

def valid_tip?(tip_amount)
  p (tip_amount >= 0 && tip_amount < 100) ? true : false
end

bill_amount = nil
tip_percentage = nil

loop do
  prompt "What is the bill?"
  bill_amount = gets.chomp.to_f
  break if bill_amount > 0
  prompt "Please enter a positive value"
end
loop do
  prompt "What is the tip percentage?"
  tip_percentage = gets.chomp.to_f
  break if valid_tip?(tip_percentage)
  prompt "Please enter a valid percentage"
end

tip = bill_amount * tip_percentage / 100
bill = bill_amount + tip
case
  when tip_percentage < 5
    msg = "You cheapo!"
  when (15 < tip_percentage) && (tip_percentage < 40)
    msg = "Nice tip!"
  when tip_percentage > 40
    msg = "You trying to score, pal?"
end
prompt "The tip is $%.2f, #{msg}" % tip
prompt "The total is $%.2f" % bill