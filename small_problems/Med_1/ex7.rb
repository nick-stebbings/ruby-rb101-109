#PROBLEM:
=begin
# Write a method that takes a sentence string as input, and returns a new string
# that contains the original string with any sequence of the words 'zero',
# 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
# converted to a string of digits.
=end
# Rules:
# it is implied that the words will be used in a sentence (i.e. that spaces will be around each instance)
# if this holds true then my solution will be fine, otherwise gsub and match would be better(forgot about punct!)
#EXAMPLES:
#puts word_to_digit('Please call me at five five five one two three four. Thanks.')
# => 'Please call me at 5 5 5 1 2 3 4. Thanks.'
# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT:

# ALGORITHM - break up the sentence into an array of words using chars
#            - if translator.any? word.match?(num) then gsub the index number of TRANSLATOR[word.downcase]
#           - rejoin with spaces

# CODE:
TRANSLATOR = %w(zero one two three four five six seven eight nine)
def word_to_digit(sentence)
  TRANSLATOR.each { |num| sentence.gsub!(%r[\b#{num}\b]i, "#{TRANSLATOR.index(num).to_s}") }
  sentence
end
puts word_to_digit('Please call me at five five five one two three four. Thanks.')
