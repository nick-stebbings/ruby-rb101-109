
# input - one string, one positive integer (as arguments to the method)
# output - prints the string as many times as the integer
# algo - take 2 arguments,
#      - need validation?
# use times method on the integer object

def repeat(string,int)
  int.times{ puts string }
end
repeat('Hello', 3)