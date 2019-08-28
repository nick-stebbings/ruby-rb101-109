=begin
module Walkable
  def walk
    "#{self.name} #{gait} forward"
  end
end

class Noble
  attr_reader :name, :title
  include Walkable
  
  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def walk
    "#{title} #{super}"
  end
  
  def gait
    "struts"
  end
end
class Person
  attr_reader :name
  include Walkable
  
  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name
  include Walkable
  
  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  include Walkable
  
  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end
=end

module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Animal
  attr_reader :name
  include Walkable
  
  def initialize(name)
    @name = name
  end
  
  def to_s
    name
  end
end

class Person
  attr_reader :name, :title

  include Walkable

  def initialize(name, title)
    @name = name
    @title = title
    @pleb = true unless title == 'Lord' || title == 'Lady'
  end
  
  def to_s
    pleb ? "#{name}" : "#{title} #{name}"
  end

  protected
  attr_reader :pleb
  
  def gait
    "strolls"
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Animal
  private

  def gait
    "runs"
  end
end

class Noble < Person
  private

  def gait
    "struts"
  end
end
mike = Person.new("Mike", 'Mr')
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"
byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
p byron.name #=> "Byron"
p byron.title #=> "Lord"