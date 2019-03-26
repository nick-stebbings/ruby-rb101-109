# write a method
#input: one argument, a string.
# algorithm: reverse the order of words of the string
#  - first split the string into an array for sorting
#  - next use array#sort
#  - finally convert back to string
#output: a string with the new order of words

=begin examples/test cases (all return true)
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
=end  

def reverse_words(str)
  reversed_arr = str.split.sort {|a,b| b <=> a}
  answer = ''
  reversed_arr.each {|el| 
    answer += el + ' '
    }
    answer.chop
end

puts reverse_words('') == ''
puts reverse_words('Hello World') == 'World Hello'
puts reverse_words('Reverse these words') == 'words these Reverse'

# Notes: I persevered with this even though I knew it was not the most efficient way to go. This shows a thorough knowledge of Array methods is needed (my next quest!) 