def multisum(n)
  factors = (1..n).to_a.select do |num|
    (num % 5).zero? || (num % 3).zero?
  end
  factors.reduce(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168