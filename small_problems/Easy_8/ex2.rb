# Mad libs are a simple game where you create a story template with blanks for
# words. You, or another player, then construct a list of words and place them
# into the story, creating an often silly or funny story as a result.
#
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

#EXAMPLES:
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
# Do you walk your blue dog quickly? That's hilarious!

# DATA STRUCTURES:
#     -  INPUT:
#     - OUTPUT:

# ALGORITHM - 
#           -
#           -
#           -

# CODE:
def prompt(text)
  puts "=> #{text}"
end
prompt "Please enter a noun"
noun = gets.chomp
prompt "Please enter a verb"
verb = gets.chomp
prompt "Please enter an adjective"
adjective = gets.chomp
prompt "Please enter an adverb"
adverb = gets.chomp
def mad_lib(n,v,adj,adv)
  prompt "Your #{adj} #{n} has learnt to #{v} very #{adv}"
end
mad_lib(noun,verb,adjective,adverb)