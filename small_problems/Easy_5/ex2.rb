# PROBLEM:Create a method that takes a number of minutes, positive or negative, and calculates the 24 hour format time (hh:mm) of that many minutes before(+ve)/after(-ve)) midnight. 
#rules: - Do not use Ruby's date/time classes.
#       - Disregard Daylight Savings and Standard Time and other complications.
# EXAMPLES: 
=begin
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
=end
# DATA STRUCTURES: input: integer (assume valid), output: string (use strform)
# ALGORITHM:  - total_minutes_in_day variable inititalised at 1440
#             - add int input integer to total_minutes_in_day variable
#             - disregarding_day = total_minutes_in_day %= 1440
#             - calculate hours,minutes
#               - disregarding_day.divmod(60)
#               - this should give an array with the hours, minutes
#             - use strformat to enter the values into a string and output
MINUTES_IN_DAY = 1440
DAYS = { 0 => 'Sunday', 1=> 'Monday', 2=> 'Tuesday', 3=> 'Wednesday', 4=> 'Thursday', 5=> 'Friday', 6=> 'Saturday' }

def time_of_day_orig(int)
  minutes_counter = int + MINUTES_IN_DAY
  minutes_counter %= 1440 #disregard the days
  hours_minutes_array = minutes_counter.divmod(60)
  "%02i:%02i"% hours_minutes_array
end

#using Time
def time_of_day(int)
  now = Time.new(2019, 4, 14)
  (now + int * 60).strftime("%A, %H:%M")
end
p time_of_day(0)
p time_of_day(-3) #== "23:57"
p time_of_day(35)# == "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"