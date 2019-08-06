# Board
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diagonals
  INITIAL_MARKER = ' '.freeze

  def initialize
    @squares = {}
    reset
  end

  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def centre_free?
    @squares[5].unmarked?
  end

  def count_marker(squares, marker_symbol)
    squares.collect(&:marker).count(marker_symbol)
  end

  def square_about_to_win(player_marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if count_marker(squares, player_marker) == 2 && squares.any?(&:unmarked?)
        last_square = line.find { |sqr_no| @squares[sqr_no].unmarked? }
        return last_square
      end
    end
    nil
  end

  def three_identical_markers(type)
    WINNING_LINES.any? do |line|
      board_squares = @squares.values_at(*line)
      count_marker(board_squares, type) == 3
    end
  end
end
# Square
class Square
  attr_accessor :marker

  def initialize(marker = Board::INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == Board::INITIAL_MARKER
  end
end
# Player
class Player
  attr_accessor :name, :marker
  attr_accessor :score

  def initialize(marker, name = 'Player')
    @marker = marker
    @name = name
    @score = 0
  end

  def increment
    self.score += 1
  end
end
# Display module
module Display
  def prompt(message)
    puts "=> #{message}"
  end

  def joinor(array, delimiter = ', ', final = 'and')
    return array.join(" #{final} ") if array.size <= 2
    array.join(delimiter).sub(/(?=(?:[,][^,]*$))([,])/, " #{final}")
  end

  def clear
    system 'clear'
  end
end

# Game orchestration engine
class TTTGame
  # default game settings:
  SETTINGS = {  initial_board_marker: Board::INITIAL_MARKER,
                choose_marker: true,
                choose_names: true,
                first_to_move: :human,
                x_marker: 'X', # default for human
                o_marker: 'O', # default for computer
                offensive_ai: false,
                score_to_win: 3 }.freeze
  include Display

  def initialize
    @board = Board.new
    @human = Player.new(SETTINGS[:x_marker])
    @computer = Player.new(SETTINGS[:o_marker])
    @markers = { SETTINGS[:x_marker] => nil, SETTINGS[:o_marker] => nil }
    @current_player = SETTINGS[:first_to_move]
  end

  def play
    game_prep
    loop do
      play_a_match
      prompt "Congrats to, #{find_outright_winner.name} who won the match!"
      break unless play_again?
      reset
      clear_scores
      display_message(:play_again)
    end
    display_message(:goodbye)
  end

  private

  attr_reader :board, :human, :computer

  def game_prep
    clear
    display_message(:welcome)
    player_setup
  end

  def player_setup
    @human.name = ask_name(:human) if SETTINGS[:choose_names]
    user_sets_markers if SETTINGS[:choose_marker]
    @computer.name = ask_name(:computer) if SETTINGS[:choose_names]

    @markers.keys.each do |marker| # game engine storing who is who
      @markers[marker] = (@human.marker == marker ? @human : @computer)
    end
  end

  def ask_name(player)
    answer = nil
    loop do
      display_message(player == :human ? :ask_name : :ask_cpu_name)
      answer = gets.chomp
      break if !answer.empty? && answer =~ /[A-Z]/i
      prompt 'Please enter a valid name.'
    end
    answer
  end

  def user_sets_markers
    prompt "Choose which marker would you like to be: #{joinor(@markers.keys)}"
    answer = ask_for_marker
    return nil unless answer.upcase == SETTINGS[:o_marker]
    human.marker = SETTINGS[:o_marker]
    computer.marker = SETTINGS[:x_marker]
  end

  def play_a_round
    clear_screen_and_display_board
    display_match_score
    loop do
      current_player_moves
      break if someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def play_a_match
    loop do
      play_a_round
      award_score_point(@markers[find_winning_marker]) if someone_won?
      clear
      display_round_result
      sleep 2
      reset
      break if @markers.values.include?(find_outright_winner)
    end
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
    switch_player
  end

  def human_moves
    puts "Choose a square between (#{joinor(board.unmarked_keys)})"
    board[ask_for_square.to_i] = @human.marker
  end

  def ask_for_marker
    answer = nil
    loop do
      answer = gets.chomp
      break if @markers.keys.include?(answer.upcase)
      prompt 'Please choose one of the available markers.'
    end
    answer
  end

  def ask_for_square
    square = nil
    loop do
      square = gets.chomp
      break if board.unmarked_keys.include?(square.to_i) && square.size == 1
      puts 'Sorry, that is not a valid choice.'
    end
    square
  end

  def cpu_detects_winning_moves
    # Check attacking threat first, then defensive.
    # Change order of following array to make AI defensive
    check_order = [@computer, @human]
    check_order.rotate(1) if SETTINGS[:offensive_ai]
    check_order.each do |player|
      move = board.square_about_to_win(player.marker)
      return move unless move.nil?
    end
    nil
  end

  def computer_moves
    square = cpu_detects_winning_moves ||
             (board.centre_free? ? 5 : board.unmarked_keys.sample)
    board[square] = computer.marker
  end

  def human_turn?
    @current_player == :human
  end

  def someone_won?
    @markers.keys.any? { |marker| !!board.three_identical_markers(marker) }
  end

  def switch_player
    @current_player = human_turn? ? :computer : :human
  end

  def find_outright_winner
    @markers.values.find { |player| player.score >= SETTINGS[:score_to_win] }
  end

  def find_winning_marker
    @markers.keys.each do |marker|
      return marker if board.three_identical_markers(marker)
    end
  end

  def award_score_point(player)
    player.increment
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if answer =~ /^[yn]$/
      puts 'Sorry, answer must be y or n.'
    end
    answer == 'y'
  end

  def reset
    board.reset
    clear
    @current_player = SETTINGS[:first_to_move]
  end

  def clear_scores
    human.score = 0
    computer.score = 0
  end

  def display_message(type)
    msgs = { welcome: 'Welcome to Tic Tac Toe',
             ask_name: 'What is your name?',
             ask_cpu_name: 'Choose a name for the computer.',
             goodbye: "Thanks for playing Tic Tac Toe, #{human.name}, goodbye!",
             play_again: "Let's play again!",
             player_markers: "You're a #{human.marker}, #{computer.name}"\
                      " is a #{computer.marker}." }
    prompt msgs[type]
  end

  def display_board
    display_message(:player_markers)
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_round_result
    display_board
    case find_winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_match_score
    puts "(First to #{TTTGame::SETTINGS[:score_to_win]}) The scores are: \n"\
      "#{human.name} => #{human.score}, \
      #{computer.name} => #{computer.score}\n"
    puts '------------------------------------------------------------------'
  end
end

game = TTTGame.new
game.play
