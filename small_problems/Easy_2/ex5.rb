# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# Problem
# Create a program that asks for a user name then greets the user
# - If the user name is followed by '!' then put the return greeting in caps

# Examples
# see question

# Data structures
# - input: a string
# - output: a string

# Algorithm
# - prompt user for name
# - define greeting variables - shout_back and greet_normally
# - use regexp & match method to see if they were shouting in input
#   - if they were shouting, shout_back
#   - else greet_normally

# Code
def prompt(message)
  puts "=> #{message}"
end

prompt "What is your name?"
name = gets.chomp
greet_normally = "Hello #{name}"
shout_back = "HELLO #{name.upcase} WHY ARE WE SHOUTING?!"

prompt name.match(/!\Z/) ? shout_back : greet_normally
