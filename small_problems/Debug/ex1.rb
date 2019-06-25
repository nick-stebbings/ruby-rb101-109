counter = 10

def decrease(counter)
  counter - 1
end

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'