require 'yaml'
VALID_CHOICES = %w(R P SC SP L)
CHOICES_LONGFORM = %w(ROCK PAPER SCISSORS SPOCK LIZARD)
VALID = YAML.load_file('acceptable_input_hash.yml')
WINNER = YAML.load_file('winner_lookup_hash.yml')

choice = ''
scores = [0, 0]

def prompt(message)
  puts("=>#{message}")
end

def valid?(input)
  state = nil
  VALID.each do |entry|
    entry[1].flatten.include?(input) ? (state = true) : state = false
    break if state
  end
  state
end

def display_results(player1, player2)
  if WINNER[player1].include?(player2)
    p "Player wins!"
  elsif WINNER[player2].include?(player1)
    p "Computer wins!"
  else
    p "It's a tie!"
  end
end

def increment_scores(scores, result_string)
  if result_string.start_with?('Player')
    new_score = scores.shift + 1
    scores.unshift(new_score)
  elsif result_string.start_with?('Computer')
    new_score = scores.pop + 1
    scores.push(new_score)
  end
end

def return_abbrev(answer)
  answer = answer.upcase
  answer.start_with?('S') ? abbrev = answer.slice(0, 2) : abbrev = answer.chr
end

def lookup_longform(answer)
  abbrev_index = VALID_CHOICES.find_index(return_abbrev(answer))
  CHOICES_LONGFORM[abbrev_index]
end

loop do
  loop do
    system("clear")
    prompt("Choose one: #{CHOICES_LONGFORM.join(', ')}\
          (#{VALID_CHOICES.join(', ')})")
    choice = gets.chomp.upcase
    if valid?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt "Player chose #{lookup_longform(choice)};"
  prompt "Computer chose #{lookup_longform(computer_choice)}"
  choice = return_abbrev(choice)

  increment_scores(scores, display_results(choice, computer_choice))
  prompt "The scores are: #{scores}"
  if scores[0] > 4
    prompt "You won!"
  elsif scores[1] > 4
    prompt "You lost!"
  end

  prompt("Do you want to keep playing? (Y for yes)")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end
