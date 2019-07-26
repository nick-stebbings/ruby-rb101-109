# PROBLEM:
# Write a method that returns the number of Friday the 13ths in the year passed
# in as an argument.
# Rules: You may assume that the year is greater than 1752 (when the
# modern Gregorian Calendar was adopted by the United Kingdom), and you may
# assume that the same calendar will remain in use for the foreseeable future.

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: integer (year)
#     - OUTPUT: integer

# ALGORITHM - 1: Create a date object of the 1st day of the given year
#           - 2: until date = 1st of the next year
#               a) if date.wday is 5 (friday) && date.day is 13, increment a counter
#           - 3: Return the counter

# CODE:
require 'date'
def friday_13th?(year)
  count = 0
  day = Date.new(year)
  until day == Date.new(year+1)
    count += 1 if (day.wday == 5 && day.day == 13)
    day += 1
  end
  count
end
puts friday_13th?(2015) # => 3
puts friday_13th?(1986) # => 1
require 'pry'
def five_friday_months(year)
  friday_count = 0
  five_fri_months = 0
  date = Date.new(year)

  loop do
    friday_count += 1 if date.wday == 5
    if friday_count == 5
      five_fri_months += 1
      date = Date.new(year,(date.mon), -1)
    end
    date += 1
    
    if date.day == 1
      friday_count = 0
    end
    break if date == Date.new(year+1)
  end
  five_fri_months
end
puts five_friday_months(1986) #3