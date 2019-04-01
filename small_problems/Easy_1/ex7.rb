# write a method taking as INPUT : positive integer
# OUTPUT: a string of alternating 1s and 0s, always start with 1
# ALGORITHM: use a loop to add a 1 or 0 to the first 1 
# end the loop when length of string == integer 
def stringy(int,rev=1)
  answer = '1'
  while (answer.length != int) do
    (answer.length.odd?) ? (answer += '0') : (answer += '1')
  end
  rev == 1 ? answer : (answer.split.rotate.join if rev == 0)
end
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(7,0)