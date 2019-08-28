class House
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    self.price <=> other.price
  end

  protected
  attr_reader :price
end
home1 = House.new(100_000)
home2 = House.new(150_000)

puts "Home 1 is cheaper" if home2 > home1
puts "Home 2 is more expensive" if home1 < home2

##FE
#Is the technique we employ here to make House objects comparable a good one? (Hint: is there a natural way to compare Houses? Is price the only criteria you might use?) What problems might you run into, if any? Can you think of any sort of classes where including Comparable is a good idea?

# This is fairly subjective, since what defines a 'greater' house is not necessarily it's price (people will have different criteria). It is easier to override the method when the comparison is between numbers or letters, since you can use the String#<=> or Integer#<=> (or Float#<=> ) but if you are customising the class in such a way then the only real limitation is to make it consistent with other class implementations of the fake operator #<=>
