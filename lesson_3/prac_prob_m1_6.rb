# My solution was to split into 2 methods that do different things.

def array_append(an_array_param)
  an_array_param << "rutabaga"
end
def string_append(a_string_param)
  a_string_param += "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string = string_append(my_string)
array_append(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"