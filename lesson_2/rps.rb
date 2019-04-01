require 'yaml'
require 'pry'
VALID_CHOICES = %w(R P S SP L)
CHOICES_LONGFORM = %w(ROCK PAPER SCISSORS SPOCK LIZARD)
VALID = YAML.load_file('acceptable_input.yml')
WINNER = YAML.load_file('winner_lookup.yml')

def prompt(message)
  puts("=>#{message}")
end

def is_valid?(input)
#RULE: is valid if the full name OR the two letter prefix (abbreviation) is given. Exceptions (e.g. common typo's) can be added to the acceptable_input.yml file.
  for entry in VALID do
  abbrev = input.upcase.slice(0,2)
    return true if entry[1].include?(input.upcase)||entry[1].include?(abbrev)
  end
end

def lookup_symbol(input)
  abbrev = input.upcase.slice(0,2)
  VALID.each do |key,value|
    if value.include?(input.upcase) || value.include?(abbrev)
      return key
    end
  nil
  end
end

def lookup_longform_from_symbol(input)
  abbrev = input.upcase.slice(0,2)
  abbrev_index = VALID_CHOICES.find_index(abbrev)
  CHOICES_LONGFORM[abbrev_index]
end

def display_results(player1,player2)
    if WINNER[player1].include?(player2)
      prompt "Player wins!"
    elsif WINNER[player2].include?(player1)
      prompt "Computer wins!"
    else
      prompt "It's a tie!"
    end
end

loop do
  choice = ''
  player_score = 0;

  loop do
    prompt("Choose one: #{CHOICES_LONGFORM.join(', ')}\
          (#{VALID_CHOICES.join(', ')})")
    choice = gets.chomp
    if is_valid?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  valid_user_choice = lookup_symbol(choice)
  
  display_results(choice.to_s.upcase, computer_choice)

  puts "You chose: #{lookup_longform_from_symbol(choice)}; computer chose: #{lookup_longform_from_symbol(computer_choice)}"

  prompt
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end