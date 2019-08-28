class Vehicle
  attr_reader :make, :model
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model} has #{wheels} wheels"
  end

  def wheels
    1
  end
end

class Car < Vehicle
  def wheels
    super + 3
  end
end

class Motorcycle < Vehicle
  def wheels
    super + 1
  end
end

class Unicycle < Vehicle
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    super + 5
  end

  def to_s
    super + ", and can carry #{payload}."
  end
end

car = Car.new('ford', 'focus')
truck = Truck.new('jeep', 'cherokee', '5kg')
uni = Unicycle.new('My', 'Unicycle')
puts car
puts truck
puts uni

##FE
#Would it make sense to define a wheels method in Vehicle even though all of the remaining classes would be overriding it? Why or why not? If you think it does make sense, what method body would you write?

# It would only make sense if there was some information that was common to all overridden classes that you wanted to group in one place. This would stop some repetition in the subclasses' implementations. The only example I can think of is to use 1 as the base number of wheels, then use 'super +' however many extra wheels were needed. This would not be particularly helpful, though, unless you were instantiating a unicycle! It's a bit confusing to be honest.