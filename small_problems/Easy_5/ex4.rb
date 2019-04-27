# PROBLEM:
# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word is swapped.
# Rules: assume that every word contains at least one letter
#        the string will always contain at least one word
#        assume that each string contains nothing but words and spaces
# EXAMPLES:
=begin
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
=end
# DATA STRUCTURES:
#     -  INPUT: String
#     - OUTPUT: String

# ALGORITHM - split the string to get a words array
#           - iterate through array, using str.reverse on each element
#           - join the new array
#           - output the result
require 'pry'
# CODE:
def swap(str)
  swap_words = str.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  swap_words.join(' ')
end
p swap("Oh what a wonderful day it is") == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'