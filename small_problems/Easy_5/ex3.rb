# P:  Write two methods that each take a time of day in 24 hour format, and return the
# number of minutes before and after midnight, respectively. Both methods should
# return a value in the range 0..1439.
# rules - You may not use ruby's Date and Time methods.
#       - Disregard Daylight Savings and Standard Time and other irregularities.
# Examples:
#after_midnight('00:00') == 0
#before_midnight('00:00') == 0
#after_midnight('12:34') == 754
#before_midnight('12:34') == 686
# D: input - strings in 24hr time format
#   output - integer between 0 and 1439
# A: (AFTER)  - initialise an empty integer var (total)
#             - multiply hours (first two digits of string converted to_i) by 60
#             - add to total
#             - add minutes (last two digits converted to_i)
#     (BEFORE)- FIRST STEPS AS ABOVE (in fact, use this method)
#             - subtract answer from 1440 unless answer = 0

def after_midnight(str_time)
  total = 0
  total += str_time[0,2].to_i * 60
  total += str_time[3,2].to_i
end
def before_midnight(str_time)
  after_midnight(str_time) == 0 ? 0 : 1440 - after_midnight(str_time)
end
p after_midnight('00:00')# == 0
p before_midnight('00:00')# == 0
p after_midnight('12:34') #== 754
p before_midnight('12:34')# == 686
