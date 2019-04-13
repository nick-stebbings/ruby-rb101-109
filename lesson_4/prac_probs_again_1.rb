flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh = {}
counter = 0
loop do
  break if counter == flintstones.length
  current_value = flintstones[counter]
  hsh[current_value] = counter
  counter += 1
end
p hsh