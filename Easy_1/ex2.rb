# write a method
# take as input one integer: +ve, -ve, or 0
# output is true if the absolute value is odd
# assume input is valid
def is_odd?(integer)
  !(integer.abs.remainder(2) == 0)
end
p is_odd?(2)
p is_odd?(5)
p is_odd?(-17)
p is_odd?(-8)
p is_odd?(0)
p is_odd?(7)