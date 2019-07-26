# PROBLEM:
# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods, exclamation points, or question marks! Any sequence of
# characters that are not spaces or sentence-ending characters should be treated
# as a word. You should also print the number of words in the longest sentence.
# Rules:

#EXAMPLES:

# DATA STRUCTURES:
#     -  INPUT:
#     - OUTPUT:


# CODE:
def print_longest_sentence_1(filename)
  File.open(filename, 'r') do |file|
    file.each do |line|
      puts line
      puts "------"
    end
  end
end
p print_longest_sentence_1('tdl.txt')




def print_longest_sentence(filename)
  match = %r{(?<=[.!?])}
  File.open(filename, 'r') do |file|
    content = file.read
    longest = content.split(match).max { |a, b| a.split(" ").size <=> b.split(" ").size }
    puts longest
    puts "... is the longest sentence with #{longest.split(" ").size} words!"
  end
end
print_longest_sentence("pg84.txt")
print_longest_sentence("tdl.txt")
