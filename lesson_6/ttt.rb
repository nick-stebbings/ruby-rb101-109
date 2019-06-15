INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
PLAYERS = %w(computer player).map!(&:freeze)

require 'pry'
first_player = 'choose' # 'choose' or set a default from PLAYERS array

def prompt(message)
  puts "=> #{message}"
end

def joinor(array, delimiter = ', ', final = 'or')
  return array.join(" #{final} ") if array.size <= 2
  array.join(delimiter).insert(-2, "#{final} ")
end

def first_player_change(input)
  if input.casecmp('y').zero?
    loop do
      prompt "Please choose: #{joinor(PLAYERS)}."
      choice = gets.chomp
      return choice if PLAYERS.include?(choice)
    end
  end
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def detect_threat(brd)
  # Check attacking threat first, then defensive. Change order of array to make AI defensive
  check = [COMPUTER_MARKER, PLAYER_MARKER]
  check.each do |player|
    marker = player
    WINNING_LINES.each do |line|
      brd_line = brd.values_at(*line)
      threat = (brd_line.count(marker) == 2 && brd_line.count(INITIAL_MARKER) == 1)
      return line.select { |square| brd[square] == INITIAL_MARKER }[0] if threat
    end
  end
  nil
end

def computer_places_piece!(brd)
  square = [INITIAL_MARKER].include?(brd[5]) ? 5 : empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def computer_defends!(brd)
  # The best defence is good offence. See line 49 for order of play.
  brd[detect_threat(brd)] = COMPUTER_MARKER
end

def place_piece!(board, current_player)
  case current_player
  when 'player'
    player_places_piece!(board)
  when 'computer'
    if detect_threat(board)
      computer_defends!(board)
    else
      computer_places_piece!(board)
    end
  end
end

def alternate_player(current_player)
  PLAYERS.reject { |player| player == current_player }.first
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), '; ')}):"
    square = gets.chomp.to_i

    break if empty_squares(brd).include?(square)
    prompt "That's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'Player' if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return 'Computer' if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

# Game begins
scores = { 'Computer' => 0, 'Player' => 0 }
first_choice_decided = ''
if first_player == 'choose'
  prompt 'Would you like to choose who goes first? (Y/N)'
  first_choice_decided = gets.chomp
  case first_player_change(first_choice_decided)
  when 'player'
    scores.keys.rotate!
    first_player = 'player'
  else
    first_player = 'computer'
  end
end
sentence_end = (first_choice_decided.casecmp('y').zero? ? '.' : ' by default.')
prompt "#{first_player.capitalize} goes first#{sentence_end}"
sleep 1

loop do
  prompt 'The current scores are:'
  prompt "#{scores.keys.first}: #{scores.values.first}"
  prompt "#{scores.keys.last}: #{scores.values.last}"
  sleep 2 unless scores.values.reduce(:+).zero?

  current_player = first_player
  board = initialize_board
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    scores[detect_winner(board)] += 1
    prompt "#{detect_winner(board)} won the round!"
  else
    prompt "It's a tie!"
  end

  break if scores.values.any? { |score| score == 5 }
end
prompt "#{scores.key(scores.values.max)} won the game."
prompt 'The final scores are:'
prompt "Player: #{scores['Player']}"
prompt "Computer: #{scores['Computer']}"
prompt 'Thanks for playing noughts and crosses!'
