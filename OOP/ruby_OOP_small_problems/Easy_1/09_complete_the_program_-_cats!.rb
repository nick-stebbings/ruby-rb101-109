class Pet
  attr_accessor :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :color
  def initialize(name, age, col)
    super(name, age)
    @color = col
  end
  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

## FE
#An alternative approach to this problem would be to modify the Pet class to accept a colors parameter. If we did this, we wouldn't need to supply an initialize method for Cat.
#
#Why would we be able to omit the initialize method? Would it be a good idea to modify Pet in this way? Why or why not? How might you deal with some of the problems, if any, that might arise from modifying Pet?

# we could omit the initialize method because when a Cat object was instantiated, Ruby would look up the class heirarchy to find a method called 'initialize' and would find it in the superclass, Pet.
# It mightn't be a good idea to give a colour attribute to every element of the Pet class (e.g. pet lizards are difficult to assign a color attribute to). You could create initialize methods for any Pet subclasses that didn't have a color, and use a more specific implementation for Lizard instantiation that didn't call on Pet#initialize.
