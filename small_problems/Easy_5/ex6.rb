# PROBLEM:Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.
# Rules: Words consist of any string of characters that do not include a space.
# EXAMPLES:
=begin
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
=end
# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: hash (keys are ascending integers, values are the number of occurences of that length)

# ALGORITHM - get an array of words by using str.split(' ')
#           - initialise an empty hash
#           - iterate through the array
#               - increment the value of a key if that key exists in the hash
#               - else define the key with a value of 1
#           - output the hash
# (could also use each_with_object, try simpler methods first)
# CODE:
def word_sizes(str)
  hsh = {}
  words_array = str.split(' ')
  words_array.each do |word|
    hsh.key?(word.size) ? (hsh[word.size] += 1) : hsh[word.size] = 1
  end
  hsh
end
def word_sizes_ewo(str)
  str.split(' ').each_with_object(Hash.new(0)){ |word, hash| hash[word.size] += 1 }
end
p word_sizes_ewo('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes_ewo('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes_ewo("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes_ewo('') == {}