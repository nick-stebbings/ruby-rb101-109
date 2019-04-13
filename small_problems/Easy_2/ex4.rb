# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# Build a program to tell the user when they retire, based on two inputs - age, age of retirement
# Output the year of retirement and how many years until then

# Examples

# Data structures
# - input: two strings - convert to integers greater than 0 (validate)
# - output: two strings

# Algorithm
# - Simple, but I mainly decided to use this as a chance to play with validation and output formatting methods.

# Code
require 'date'
require 'pry'
def prompt(message)
  puts "=> #{message}"
end
def is_pos_int?(input)
  (input.to_i.to_s == input) && (input.to_i > 0)
end
current_age = nil
retire_age = nil

loop do
  prompt "What age are you currently?"
  current_age = gets.chomp
  break if is_pos_int?(current_age)
  prompt "Please enter a valid age"
end
loop do
  prompt "What age would you like to retire?"
  retire_age = gets.chomp
  break if is_pos_int?(retire_age) && retire_age > current_age
  prompt "Please enter a valid whole number for retirement that is greater than your current age"
end

yrs_in_future = retire_age.to_i - current_age.to_i
retire_date = DateTime.now.next_year(yrs_in_future).to_time
dates_strf = {now: Date.today.strftime("%Y"), ret_date: retire_date.strftime("%Y")}
prompt "It's %<now>i, you will retire in %<ret_date>i." % dates_strf
prompt "Only #{yrs_in_future} years to go!"