# PROBLEM: A program that takes one or more words and returns the number of characters, minus spaces.
# EXAMPLES: See question
# DATA STRUCTURES: input: string, output: string containing integer variable
# ALGORITHM:  - ask user for a string
#             - split the string into an array using the space delimiter
#             - call .size on the each element in the array and sum to get num_char
#             - output a string containing num_char
def prompt(message)
  puts "=> #{message}"
end
num_char = 0

prompt "Please enter a word or sentence:"
string = gets.chomp
arr = string.split
for el in arr 
  num_char += el.size
end
puts "There are #{num_char} character in your string."