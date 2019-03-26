# ask user for two numbers
# ask which operation to perform
# perform the operation
# output result

Kernel.puts("Welcome to my calculator!")

Kernel.puts("Please enter a number.")
number1 = Kernel.gets().chomp()

Kernel.puts("Please enter a number.")
number2 = Kernel.gets().chomp()

Kernel.puts("Please enter an operation you would like to perform: 1) add 2) subtract 3) multiply 4) divide.")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
elsif operator == '4'
  result = number1.to_f / number2.to_f
end

Kernel.puts("The number is : #{result}")
