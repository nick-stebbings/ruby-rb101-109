# write a method
# take an array as input
# count the number of occurences of each element in the array
# case sensitive
# output: print each element alongside the number of occurences

def count_occurences(array)
  occur = {}
  
  array.each { |element| occur[element] = array.count(element) }
  occur.each { |element, count| puts "#{element} => #{count}"}
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
count_occurences(vehicles)