# PROBLEM: Make a method that returns the given string with each word capitalized (titleized)
#D: input - string, output - string
#ALGO: - split the string into word_arr
#      - map the elements of word_array (assuming we want a non-mutating method)
#         - capitalize each word
#      - join the words with a ' ' delimiter

words = "the flintstones rock"

def titleize(string)
  capitalized_words = string.split.map {|value| value.capitalize}
  capitalized_words.join(' ')
end
p titleize(words)
# my solution was the same as LS, except I didn't realise you could daisy-chain AFTER curly brackets also.