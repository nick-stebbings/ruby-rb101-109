# PROBLEM:Create a method that takes two arguments, returns true if ONLY one of the arguments is true
# EXAMPLES: See question
# DATA STRUCTURES: booleans
# ALGORITHM:  - take two expressions as input
#             - use a conditional statement to decide when to return true

def xor?(exp1,exp2)
  if (exp1 == true && !exp2) || (exp2 == true && !exp1)
    return true
  else return false
  end
end
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false