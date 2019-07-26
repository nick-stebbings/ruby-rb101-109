# PROBLEM:
# A collection of spelling blocks has two letters per block, as shown in this
# list:
#
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

# Rules:
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used once.

#EXAMPLES:
# puts block_word?('BATCH') # => true
# puts block_word?('BUTCH') # => false

# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: boolean

# ALGORITHM - Convert string to array of characters
#            - Iterate through the array, calling block_used? on each
#             - When block_used? returns true, the word cannot be formed so return false from the method
#           
# block_used? algorithm - /take as input
#                           - a string consisting of one letter (upper case)
#                           - an array of previously used letters - previous_letters
#                   - /lookup the letter from the BLOCK_DICTIONARY constant which stores the blocks in arrays
#                   - /iterate through the array previous_letters
#                     - /if the characters include either letter from the block, return true
#                       - /else false
BLOCK_DICTIONARY = [%W(B O), %W(X K), %W(D Q), %W(C P), %W(N A), %W(G T), %W(R E), %W(F S), %W(J W), %W(H U), %W(V I), %W(L Y), %W(Z M)]
# CODE:
def block_used?(letter, previous)
  block = BLOCK_DICTIONARY.select { |block| block.include?(letter.upcase) }.flatten
  block.each do |block_letter|
    (return true) if previous.map{ |char| char.upcase }.include?(block_letter)
  end
  false
end
def block_word?(str)
  chars = str.chars
  !chars.each_with_index.any? { |char, i| block_used?(char, chars[0,i]) }
end
p block_word?('hello') # => false
p block_word?('helo') # => true
puts block_word?('BATCH') # => true
puts block_word?('BUTCH') # => false

## FE: Experiment to see whether this could be modelled using OOP. The answer... yes probably but it became so long winded compared to the initial problem solution. Although there are 'nouns' of blocks with 'states' of '(un)used', without creating a class for the block library and using the blocks as associative objects... . (long-winded!) This problem is not complicated enough to warrant this kind of solution, however if a dictionary of spellable words was to be formed, and more blocks needed to be removed or added, why not?
class Block
  attr_reader :let_arr, :used
  
  @@collection = []
  def self.collection
    @@collection
  end
  
  def self.spellable?(word)
    arrays = @@collection.map { |block| block.let_arr }
    word.chars.each do |char|
      block_found = arrays.assoc(char.upcase) || arrays.rassoc(char.upcase)
      p block_found
      #if block_found then CHANGE STATE OF BLOCK
      #end
      #@@collection.none? { |block| block.used? }
    end
  end
  
  def initialize(letters)
    @let_arr = letters
    #@used = false
    @@collection << self
  end
  
  def to_s
    "#{let_arr}"  
  end
  
  def remove
    @@collection.delete(self.let_arr)
  end
end
BLOCK_DICTIONARY.each { |block| Block.new(block) }
Block.spellable?('BURCH')