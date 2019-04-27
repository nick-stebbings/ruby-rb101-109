# PROBLEM:
# Write a method that will take a short line of text, and print it within a box.
# Rules: You may assume that the input will always fit in your terminal window.
# EXAMPLES:
=begin
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
print_in_box('')
+--+
|  |
|  |
|  |
+--+
=end
# DATA STRUCTURES:
#     -  INPUT: string
#     - OUTPUT: multiline string

# ALGORITHM - construct a string for the first/last lines
#           -
#           - construct a string for the 2nd/2nd-to-last lines
#           -
#           - construct a string for the middle line
#             - concatenate first a |, then ' ', then string, then ' ', then |
#           - output them in correct order with linebreaks

# CODE:
def print_in_box(str)
  top_bottom_line = '+'
  (str.length + 2).times{top_bottom_line += '-'}
  top_bottom_line += '+'
  
  second_line = '| '
  str.length.times{second_line += ' '}
  second_line += ' |'
  
  middle_line = '| ' + str + ' |'
  
  puts top_bottom_line
  puts second_line
  puts middle_line
  puts second_line
  puts top_bottom_line
end
print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Hey look, I got it to work first time! Sweet. String interpolation would have been tidier though')
# FURTHER EXPLORATION:
# For a real challenge, try word wrapping very long messages so they appear on
# multiple wrapped_message, but still within a box.
CON_WIDTH = 76
def convert_to_line_array(str)
  n = str.length / CON_WIDTH
  str_wrapped = []
  for i in (1..n) do
    str_wrapped[i] = "| #{str.slice!(0..CON_WIDTH)} |"
  end
  str_wrapped
end
def print_in_box_2(str)
  top_bottom_line = '+-'
  second_line = '| '
  
  if str.length < CON_WIDTH - 2
    (str.length + 2).times{top_bottom_line += '-'}
    str.length.times{second_line += ' '}
    middle_lines = '| ' + str + ' |'
  else
    (CON_WIDTH).times do
      top_bottom_line += '-'
      second_line += ' '
    end
    middle_lines = convert_to_line_array(str)
  end
  
  top_bottom_line += '-+'
  second_line += ' |'
  
  puts top_bottom_line
  puts second_line
  puts middle_lines
  puts second_line
  puts top_bottom_line
end
print_in_box_2('Hey look, I got it to work first time! Sweet. String interpolation would have been tidier thoughHey look, I got it to work first time! Sweet. String interpolation would have been tidier thoughHey look, I got it to work first time! Sweet. String interpolation would have been tidier thoughHey look, I got it to work first time! Sweet. String interpolation would have been tidier thoughHey look, I got it to work first time! Sweet. String interpolation would have been tidier thoughHey look, I got it to work first time! Sweet. String interpolation would have been tidier thoughHey look, I got it to work first time! Sweet. String interpolation would have been tidier thoughHey look, I got it to work first time! Sweet. String interpolation would have been tidier though')
# It almost works perfectly, but this is not the sort of problem I want to sink hours into!