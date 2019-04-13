# PROBLEM: Ask for two numbers, then output the result of using 6 different arithmetic operators on them (+, -, *,/,%,**).
# EXAMPLES: See question
# DATA STRUCTURES: two strings as input (conver to float), 6 strings as output
# ALGORITHM: - Use prompt to ask for 2 separate integers (don't worry about validation)
#            - Calculate 6 different answers for the 6 different operators
#            - Puts the output to each of the calculations

def prompt(message)
  puts "=> #{message}"
end

prompt "Please enter a number"
num1 = gets.chomp
prompt "Please enter a second number"
num2 = gets.chomp
operators = [%w(add +), %w(minus -), %w(times *), %w(over /), %w(modulo %), ['to the power', '**']]
operators.each do |op|
  prompt "#{num1} #{op[0]} #{num2} is #{eval(num1 + op[1] + num2)}"
end