require 'yaml'
LANGUAGE = 'es'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(msg, language='en')
  MESSAGES[language][msg]
end

def prompt(key)
  message = messages(key,LANGUAGE)
  Kernel.puts("=> #{message}")
end

def valid_number?(int)
  int.to_i() != 0
end

def op_to_msg(op)
  case op
  when '1'
  'Adding'
  when '2'
  'Subtracting'
  when '3'
  'Multiplying'
  when '4'
  'Dividing'
  end
end

prompt('welcome')
name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

loop do #main loop

  number1 = nil
  loop do
      prompt('num1')
      number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("You messed up. That's not valid.")
    end  
  end 
  number2 = ' '
  loop do
    prompt("Please enter a second number.")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("You messed up. That's not valid.")
    end  
  end 

  operator_prompt = <<-MSG
1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ' '

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end
  prompt("#{op_to_msg(operator)} the two numbers...")

  result = case operator
          when '1'
            number1.to_i + number2.to_i
          when '2'
            number1.to_i - number2.to_i
          when '3'
            number1.to_i * number2.to_i
          when '4'
            number1.to_f / number2.to_f
          end
  prompt("The number is : #{result}")
  
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for that!")