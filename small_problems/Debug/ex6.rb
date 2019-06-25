def move(n, from_array, to_array)
  return if n.zero? || from_array.empty?
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end
# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']
blank = []
move(2, todo, done)
move(2, blank, done)
p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# There is no break condition!
