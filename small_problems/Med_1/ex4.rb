# PROBLEM:
=begin
# You have a bank of switches before you numbered from 1 to 1000. Each switch is
# connected to exactly one light that is initially off. You walk down the row of
# switches, and turn every one of them on. Then, you go back to the beginning
# and toggle switches 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and
# so on, and keep going until you have been through 1000 repetitions of this
# process.
#
# Write a program that determines how many lights are on at the end, and which
# lights are on.
=end
# Rules:

#EXAMPLES:
# Example with 5 lights:
#
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lignts 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4.
#
# With 10 lights, 3 lights are left on: lights 1, 4, and 9.

# DATA STRUCTURES:
#     -  INPUT: n = number of lights
#     - OUTPUT: array of lights that are on, num = size of the array

# ALGORITHM - /create method to toggle the lights
#             - this takes x as argument, where x is the round number (step between toggles)
#             - this takes arr as another argument, where arr is the array to be toggled
#             -it should return the array, toggled for round x
#           - /initialise an array of length n with 0's to indicate the lights are off
#           - /for i in (1..n), arr = toggle_lights(arr,i)

#toggle_lights ALGORITHM:     - map the array
#                               - /if index is divisble by x, the block returns the toggled element
#                               - /if element %x !=0 , the block returns the element

#toggle_element ALGO:         - /if element == 0, return 1
#                             - /if element == 1, return 0

# CODE:
def toggle_light(el)
  1 - el
end

def toggle_lights(lights_arr, x)
  lights_arr.map.with_index { |state, idx| (idx + 1) % x == 0 ? toggle_light(state) : state }
end

def initialise_lights(n)
  arr = [0] * n
end

def lights(n)
  states = initialise_lights(n)
  (1..n).each do |i|
    states = toggle_lights(states,i)
  end
  # how_many_lights_on = states.reduce(:+)
  states.map.with_index{|light, idx| light == 1? idx + 1 : nil }.compact
end

def results_display(lights, n)
  on = lights
  off = (1..n).to_a - lights
  puts "Lights #{on[0..-2].join(', ')} and #{on.last} are ON." if on.size > 2
  puts "Lights #{off[0..-2].join(', ')} and #{off.last} are OFF." if off.size > 2
  puts "Lights #{on[0]} and #{on[1]} are on" if on.size == 2
  puts "Lights #{off[0]} and #{off[1]} are off" if off.size == 2
  puts "Light #{on[0]} is on" if on.size == 1
  puts "Light #{off[0]} is off" if off.size == 1
end

p lights(3)
p lights(5)
p lights(7)
p lights(19)
p results_display(lights(3), 3)