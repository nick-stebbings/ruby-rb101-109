statement = "The Flintstones Rock"
# PROBLEM: Create a method that returns a hash in which the k-v pairs are each letters and the frequency with which the letter appears in the string.
# E
# D/A:  input: a string
#       output: a hash
#       algo: - initialise a blank hash/a counter
#             - iterate through the string, 
#                - first checking if the char is in the hash
#                - if it is in the hash, increment the value for that key
#             - return the hash
#             - 
#             - 

def char_count_to_hash(str)
  counter = 0
  hsh = {}
  loop do
    break if counter == str.length
    current_char = str[counter]
      hsh.key?(current_char) ? hsh[current_char] += 1 : hsh[current_char] = 1
    counter += 1
  end
  hsh
end
p char_count_to_hash(statement)