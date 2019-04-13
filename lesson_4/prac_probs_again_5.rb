flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
def find_be(array)
  counter = 0
  while counter < array.length do
    current_str = array[counter]
    if current_str[0..1] == 'Be' then return counter end
    counter += 1
  end
end
p find_be(flintstones)