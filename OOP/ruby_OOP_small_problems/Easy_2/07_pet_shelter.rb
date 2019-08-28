class Pet
  attr_reader :name, :species

  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{species} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  attr_reader :not_adopted
  
  def initialize
    @owners = []
    @adopted = []
    @not_adopted = []
  end

  def admit(pet)
    not_adopted << pet
  end

  def adopt(owner, pet)
    owner.pets << pet
    @owners << owner unless @owners.include?(owner)
    if not_adopted.include?(pet)
      @adopted << not_adopted.delete_at(not_adopted.index(pet))
    else
      @adopted << pet
    end
  end

  def print_adoptions
    unless not_adopted.empty?
      puts "The animal shelter has the following unadopted pets:"
      puts not_adopted
      puts
    end
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      puts owner.pets
      puts
    end
  end
end

found_animals = {  dog: %w(Asta Laddie Kennedy Molly),
                   cat: %w(Butterscotch Pudding Fluffy Kat Ben),
              parakeet: ['Sweetie Pie'],
                  fish: %w(Chester),
        bearded_dragon: ['Darwin']
  }

shelter = Shelter.new

found_animals.each do |species, names|
    names.each { |name| shelter.admit(Pet.new(species, name)) }
end

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter.adopt(phanson, shelter.not_adopted.first)
shelter.adopt(bholmes, shelter.not_adopted.select{ |pet| pet.species == :dog }.last)
shelter.adopt(phanson, shelter.not_adopted.last)
puts
shelter.print_adoptions
puts
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


#The animal shelter has the following unadopted pets:
#a dog named Laddie
#a dog named Kennedy
#a cat named Butterscotch
#a cat named Pudding
#a cat named Fluffy
#a cat named Kat
#a cat named Ben
#a parakeet named Sweetie Pie
#a fish named Chester
#

#P Hanson has adopted the following pets:
#a dog named Asta
#a bearded_dragon named Darwin

#B Holmes has adopted the following pets:
#a dog named Molly
#
#P Hanson has 2 adopted pets.
#B Holmes has 1 adopted pets.
