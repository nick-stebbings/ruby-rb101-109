# PROBLEM:
=begin
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes, and seconds. You should use a degree symbol (˚) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. There are 60 minutes in a degree, and 60 seconds in a minute.
# Rules:

#EXAMPLES:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
=end

# DATA STRUCTURES:
#     -  INPUT: float
#     - OUTPUT: string representing angle

# ALGORITHM - 

# CODE:
MINS_IN_DEG = 60
SECS_IN_MIN = 60
SECS_IN_DEG = 60 * 60

def dms(angle)
  angle_seconds = angle * SECS_IN_DEG
  degs, mins = angle_seconds.divmod(SECS_IN_DEG)
  mins, secs = mins.divmod(SECS_IN_MIN)
  "(%<degs>d°%<mins>02d'%<secs>02d\")" % {degs: degs, mins: mins, secs: secs}
end
puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== #%(254°36'00")
puts dms(93.034773) #== #%(93°02'05")
puts dms(0) #== #%(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")