password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
end

def verify_password(pwd)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == pwd
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if password.nil?
  password = set_password
end

verify_password(password)