# PROBLEM:
# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.
# EXAMPLES:
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

# ALGORITHM - adapt the block for the each_with_object method like so:
#             - word.chars.select to only include alphanumerics
#             - then join the selection back into a string  
# CODE:
def word_sizes_2(str)
  str.split(' ').each_with_object(Hash.new(0)) do |word, hash|
    word = word.chars.select {|char| char.match?(/[A-Za-z]/)}.join('')
    hash[word.size] += 1
  end
end
# get used to using gsub! with regexp, as it is a lot pithier than the above!S
p word_sizes_2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes_2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes_2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes_2('') == {}