# Planning based on PEDAC
# https://medium.com/launch-school/solving-coding-problems-with-pedac-29141331f93f

# UNDERSTAND THE PROBLEM:
#  - Write a method that takes a year as input and returns the century.
#  - assume input will be a valid year
#  - RULES: For suffixes: Centuries ending with 1 : st
#                                   ending with 2 : nd
#                                   ending with 3 : rd
#                                   EXCEPT 11 - 14 : th
#                                   everything else : th
#           New centuries begin in years that end with 01
#

# Examples:
# see Q

# Data structures:
# - INPUT: integer
# - OUTPUT: string

# Algorithm:
# - ask for input
# - assign input to a string 'year'
# - convert to int
# - divide the year by 100 and add 1 in order to get the century
# - assign a suffix to the year using a conditional based on the rules above
#    use an include? for the range (11..13) to return the exceptions

# Code:
def prompt(message)
  puts "=> #{message}"
end

def in_exceptions?(year)
  (11..13).include?(year % 100) 
end

def ask_input
  str = ''
  loop do
    prompt "Please enter a year"
    str = gets.chomp
    break if (str.to_i.is_a? Integer)
    prompt "Please enter a valid year"
  end
  return str
end

def century(year)
  century = (year.to_i / 100) + 1
  century -= 1 if (year.to_i % 100) == 0

  unless in_exceptions?(year)
    case
      when century.digits.first == 1
        year_suff = 'st' unless in_exceptions?(year)
      when century.digits.first == 2
        year_suff = 'nd' unless in_exceptions?(year)
      when century.digits.first == 3
        year_suff = 'rd'unless in_exceptions?(year)
      else
        year_suff = 'th'
    end
  end
  puts century.to_s + year_suff
end
century(ask_input)