=begin
def running_total(array)
  array.each_with_object([]) do |element, memo|
    memo.length.zero? ? memo << element : memo << element + memo.last
  end
end
=end
def running_total(array)
  results = []
  array.inject(0) do |sum,el|
    results << (sum + el)
    results.last
  end
  results
end
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []