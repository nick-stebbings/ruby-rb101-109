# PROBLEM:
=begin
Write a method that takes a single String argument and returns a new string that
contains the original value of the argument, but the first letter of every word
is now capitalized.

# Rules: You may assume that words are any sequence of non-blank characters, and that
# only the first character of each word must be considered.
# CODE:

def word_cap(str)
  str.split(" ").map{|word| word.capitalize }.join(" ")
end

def word_cap(str)
  words = str.split.map do |word|
    word.chars.map.with_index { |char, idx| idx.zero? ? char.upcase : char.downcase }.join("")
  end
  words.join(" ")
end
=end
def word_cap(str)
  str.split.map { |word| [word.chr.upcase] << (1..word.size.pred).map { |i| word[i].downcase } << ' ' }.join.strip
end
puts word_cap('four score and seven')    # => 'Four Score And Seven'
puts word_cap('the javaScript language') # => 'The Javascript Language'
puts word_cap('this is a "quoted" word') # => 'This Is A "quoted" Word'