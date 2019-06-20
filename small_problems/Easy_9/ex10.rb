# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit
def buy_fruit(ary)
  list = []
  ary.map { |item| item[1].times{ list << item[0] } }
  list
end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
# => ["apples", "apples", "apples", "orange", "bananas","bananas"]