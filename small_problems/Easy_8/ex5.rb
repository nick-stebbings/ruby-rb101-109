# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. 
# Rules:
# You may (and should) use the substrings method you wrote in the previous
# exercise.

# The return value should be arranged
# in the same sequence as the substrings appear in the string. Duplicate
# palindromes should be included multiple times.

# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor
# "Abc-bA" are. In addition, assume that single characters are not palindromes.

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: ary

# ALGORITHM - select over all substrings, returning true if sub_str == subs_str.reverse

# CODE:
def substrings_at_start(str)
  chars = str.chars
  chars.each_with_object([]).with_index { |(el,memo), idx| memo << chars.take(idx+1).join('').to_s }
end
def substrings(str)
  arr = (0..str.length-1).each_with_object([]) do |idx,memo|
    memo << substrings_at_start(str[idx..-1])
  end
  arr.flatten
end
def palindromes1(str)
  substrings(str).select { |substr| substr.size > 1 && substr == substr.reverse }
end
def palindrome?(str)
  str == str.reverse && str.size > 1
end
# FURTHER EXPLORATION:
def palindromes(str, ignore_non_alpha = true )
  subs = substrings(str)
  pal_subs = subs.select{ |pal| palindrome?(pal) }
  ignore_non_alpha ? subs.select{ |pal| palindrome?(pal.downcase  .gsub(/[^A-Za-z0-9]/, '')) } : pal_subs
end
p palindromes('abcd')   # => []
p palindromes('madam')  # => ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') # => [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') # => [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
p palindromes('kniT!ting casSeTtes', false)