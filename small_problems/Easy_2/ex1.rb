def teddy_age(name=nil, age)
  puts "=> What is your name?"
  name = gets.chomp
  if name == ''
    puts "Teddy is #{age} years old!"
  else 
    puts "#{name} is #{age} years old!"
  end
end
teddy_age(rand((20..200)))