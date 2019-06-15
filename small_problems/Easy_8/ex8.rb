# Write a method that takes a string, and returns a new string in which every
# consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
# whitespace should not be doubled.
# Rules:

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT:
#     - OUTPUT:

# ALGORITHM - 
#           -
#           -
#           -

# CODE:
CONSONANTS = ('a'..'z').to_a - %w(a e i o u)
def double_consonants1(str)
  str.chars.map { |char| (CONSONANTS.include?(char.downcase) ? char + char : char ) }.join
end
def double_consonants(str)
  str.gsub(/([A-Z&&[^AEIOU]])/i, '\1\1')
end


puts double_consonants('String')       # => "SSttrrinngg"
puts double_consonants("Hello-World!") # => "HHellllo-WWorrlldd!"
puts double_consonants("July 4th")     # => "JJullyy 4tthh"
puts double_consonants('')             # => ""