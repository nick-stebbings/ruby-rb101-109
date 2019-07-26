# PROBLEM:
# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise.
# Rules: To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
# Implicit - it is only () type parentheses we are monitoring
#          - return true if the string is empty, false if null

#EXAMPLES:
#puts balanced?('What (is) this?')      # => true
#puts balanced?('What is) this?')       # => false
#puts balanced?('What (is this?')       # => false
#puts balanced?('((What) (is this))?')  # => true
#puts balanced?('((What)) (is this))?') # => false
#puts balanced?('Hey!')                 # => true
#puts balanced?(')Hey!(')               # => false
#puts balanced?('What ((is))) up(')     # => false
#MENTAL MODEL:
# Take a string and compute whether the brackets in the string are all opened/closed in a balanced fashion.
# Each bracket should have a corresponding opener/closer within the string.

# DATA STRUCTURES:
#     -  INPUT: str
#     - OUTPUT: boolean

# ALGORITHM - Assign variable to array of characters from the string
#           - Assign variable to an empty stack array
#           - Iterate through the array of characters 
#               -  If an open bracket is encountered, add it to the stack
#               -  If a closing bracket is encountered, check whether 
#                   - a) the stack is empty.. if so this is an unbalanced bracket, return false
#                   - b) if not, remove the last element from the stack and continue 
#               - if the stack contains unclosed brackets (i.e. !empty? at the end of the loop), return false
#               - if the stack is empty at the end of the loop, return true

# CODE:
#def balanced?(str)
#  chars = str.chars
#  stack = Array.new
#  chars.each do |char|
#    case char
#      when '('
#       stack.push(char)
#      when ')'
#        stack.empty? ? (return false) : stack.pop
#    end
#  end
#  stack.empty?
#end
## Attempt at using regex string matching:
## ^(?:[^()]*(\()[^)]*(?(1)[^)]*(\))))*$
## broken down:
#^ #from start of string
#  (?: #non-capturing group begins
#    [^()]* # 0 or more non bracket characters 
#          (\() # an opening parens ( *in capture group 1
#            [^)]* # 0 or more non-closings-parens ) characters
#              (?(1)[^)]* # conditional group - of capture group 1 was set above*
#                (\)) # must match against a closing parens
#                  ) # end of conditional grouping
#            )* # match one or more of this non-capturing group (of matched parens)
#              $ # to end of string

#This works! upto a point: Any nested opening brackets it is not valid for. Possible look into recursive regex for this?

# FE:
require 'pry'

OPPOSITES = {
  ")" => "(",
  "}" => "{",
  "]" => "["
}.freeze
QUOTES = ["\"", "'"].freeze

def balanced_2?(str)
  chars = str.chars
  stack = Array.new
  chars.each do |char|
    case char
    when /[({\[]/
     stack.push(char)
    when /[)}\]]/
      closer = OPPOSITES[char]
      stack.count(closer).zero? ? (return false) : stack.delete_at(stack.index(closer))
    end
  end
  stack.empty? && QUOTES.all? { |quotemark| str.count(quotemark).even? }
end
puts balanced_2?('What [is] (thi)s?')      # => true
puts balanced_2?('Wh[at i]s (this?')       # => false
puts balanced_2?('Wh{{{at i}}}s ()t]his?')       # => false
puts balanced_2?('({What}) [(is this)]?')  # => true
puts balanced_2?('((What)) (is this))?') # => false
puts balanced_2?("((What))\" (is this))?") # => false
puts balanced_2?("((What))\" ((is th\"is))?") # => true
puts balanced_2?("((What))\" (is th'is))?") # => false












