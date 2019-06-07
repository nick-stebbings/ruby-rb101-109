=begin
Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels (a, e, i, o, u) removed.
=end

#EXAMPLES:
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
#remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# DATA STRUCTURES:
#     -  INPUT: ary of strings
#     - OUTPUT: ary of strings

# ALGORITHM - for word in words
#             - for n = 1..word.length
#               - delete if 'aeiou'.include? char

# CODE:
VOWELS = %w(a e i o u)
#def remove_vowels(words)
 # words.map do |word|
  #   word.chars.map! { |char| VOWELS.include?(char.downcase) ? '' : char }.join('')
  #end
#  words
#end
def remove_vowels(words)
  words.each_with_object([]) { |word, result| result << word.gsub(/[aeiou]/i, '') }
end
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz))# == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) #== %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) #== ['BC', '', 'XYZ']