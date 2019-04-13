=begin
The initial code has a method definition that tries to use an outer scope local variable. This raises the error 'undefined local variable.' We can fix it by passing the variable to the method as a parameter, or by making the limit a constant.
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
=end
limit = 15

def fib(first_num, second_num,limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"