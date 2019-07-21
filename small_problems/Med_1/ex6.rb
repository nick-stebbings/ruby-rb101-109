# PROBLEM:
=begin
# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:
#
# n Place a value n in the "register"
# PUSH Push the register value on to the stack
# ADD Add value on stack to the register value
# SUB Subtract value on stack from the register value
# MULT Multiply value on stack by the register value
# DIV Divide value on stack into the register value
# MOD Divide value on stack into the register value and leave remainder
# POP Remove item from stack and place in register
# PRINT print the register value
# ADD, SUB, MULT, DIV, and MOD all remove the topmost item from the stack,
# perform the operation, and leave the result in the register.

# Rules:
# All operations are integer operations (which is only important with DIV and
# MOD).
# You should initialize the register to 0.
# When register is 0 we need to warn against division!

# Programs will be supplied to your language method via a string passed in as an
# argument. Your program may assume that all programs are correct programs; that
# is, they won't do anything like try to pop a non-existent value from the
# stack, and they won't contain unknown tokens.

#EXAMPLES:

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
=end
# (nothing printed; no PRINT commands)
# DATA STRUCTURES:
#     -  INPUT: str
#     - OUTPUT: integer

# ALGORITHM -/ initialise register to 0
#           -/ create empty array for the stack
#           -/ convert command string into array
#           -/ operations at the front need to be processed first, so take the first word or integer
#             -/check 0 hasn't been passed as n (this limits operations)
#             -else
  #             -/if string.split.first.to_i > 0 then register = string.split.first
  #             -if !string.split.first.to_i then command = string.split.first

#           - define push and pop in our program
#              - if (the result of the take(2) above).last == push then
#                - stack.push(register)
#              - if (the result of the take(2) above).last == pop then 
#                - stack.pop(register)
#           - define print in our program
#           - define integer operations in our program:
#               - if result of take(2) == ADD, SUB, MULT, DIV, or MOD
#                   - case when (to define the operator used)
#                       - register = stack.pop (operator) register 

#          - iterate through the command array, performing above, shifting each time, until command_array.length ==0

# CODE:
COMMANDS = %W[PRINT PUSH POP ADD SUB MULT DIV MOD]

OPERATORS = {'ADD' => :+, 
             'SUB' => :-, 
             'MULT' => :*, 
             'DIV' => :/, 
             'MOD' => :%
    }

ERRORS = {
  zero_div: "=> You are attempting to divide by 0. I suggest you don't.",
  empty_stack: "=> Your stack is empty, so you can't perform an operation.",
  invalid_token: "=> Your instructions contain an invalid token somewhere in the code.",
  zero_reg: "=> WARNING: Register is now 0, ensure you chose command excluding division"
  }

def error_report(command, stack, register)
  if stack.empty?
    ERRORS[:empty_stack]
  elsif command == 'DIV' && stack.last.zero?
    ERRORS[:zero_div]
  elsif OPERATORS[command].nil?
    ERRORS[:invalid_token]
  else
    nil
  end
end

def minilang(command_string)
  register, stack  = 0, []
  commands = command_string.split
  
  until commands.empty? do
    command = commands.shift
    if command.to_i.zero? && (command.to_i.to_s == command)
       puts ERRORS[:zero_reg]
       next
    elsif command.to_i.zero? # i.e. The command is a word ( or 0) , not an integer for entry into register
      case command
      when "PRINT"
        puts register
      when "PUSH"
        stack.push(register)
      when "POP"
        register = stack.pop
      else
        binding.pry
        error_return = error_report(command, stack, register)
        if error_return.nil?
          register = register.public_send(OPERATORS[command], stack.pop)
        else
          return p error_return
        end
      end
     else
       register = command.to_i
    end
  end
  nil
end

minilang('PUSH 5 DIV')
# error
minilang('PULF 5')
# error
minilang('5 PUSH DfIV')
# error
minilang('PUSH POP 5 DIV')
# error

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('6 PUSH 5 MOD PRINT')

minilang('')
minilang('PUSH 0 DIV PRINT')