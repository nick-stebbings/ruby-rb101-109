# Board
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  def draw # rubocop:disable Metrics/MethodLength
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

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def []=(key, marker)
    @squares[key].marker = marker
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
        empty_square = line.select { |sqr_no| @squares[sqr_no].unmarked? }
        return empty_square[0] unless empty_square.empty?
      end
    end
    nil
  end

  def winning?(marker)
    WINNING_LINES.any? do |line|
      squares = @squares.values_at(*line)
      count_marker(squares, marker) == 3
    end
  end

  def someone_won?
    TTTGame::MARKERS.keys.any? { |marker| !!winning?(marker) }
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end
# Square
class Square
  attr_accessor :marker

  def initialize(marker = TTTGame::SETTINGS[:initial_board_marker])
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == TTTGame::SETTINGS[:initial_board_marker]
  end
end
# Player
class Player
  attr_accessor :name, :marker
  attr_reader :score
  @@num_players = 0

  def initialize(marker, name = "Player #{@@num_players + 1}")
    @@num_players += 1
    @marker = marker
    @name = name
    @score = 0
  end

  def increment
    self.score += 1
  end

  protected

  attr_writer :score
end
# Display module for TTT
module TTTDisplay
  def prompt(message)
    puts "=> #{message}"
  end

  def joinor(array, delimiter = ', ', final = 'or')
    return array.join(" #{final} ") if array.size <= 2
    array.join(delimiter).insert(-2, "#{final} ")
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
    puts
  end

  def clear
    system 'clear'
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

  def display_result
    display_board
    case winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_round_result
    puts "(First to #{TTTGame::SETTINGS[:score_to_win]}) The scores are: \n"\
      "#{human.name} => #{human.score}, \
      #{computer.name} => #{computer.score}\n"
    puts '------------------------------------------------------------------'
  end
end
# Game orchestration engine
class TTTGame # rubocop:disable Metrics/ClassLength
  attr_reader :board, :human, :computer
  # default game settings:
  SETTINGS = {  initial_board_marker: ' ',
                choose_marker: true,
                choose_names: true,
                first_to_move: :human,
                x_marker: 'X', # default for human
                o_marker: 'O', # default for computer
                offensive_ai: true,
                score_to_win: 3 }.freeze
  # Once markers are chosen, following constant is set for duration of match
  MARKERS = { SETTINGS[:x_marker] => nil, SETTINGS[:o_marker] => nil }
  include TTTDisplay

  def initialize
    @board = Board.new
    @human = Player.new(SETTINGS[:x_marker])
    @computer = Player.new(SETTINGS[:o_marker])
    @current_player = SETTINGS[:first_to_move]
  end

  def play
    game_prep
    loop do
      play_a_match
      prompt "Congrats to, #{find_outright_winner.name} who won the match!"
      break unless play_again?
      reset
      display_message(:play_again)
    end
    display_message(:goodbye)
  end

  def find_outright_winner
    MARKERS.values.find { |player| player.score == SETTINGS[:score_to_win] }
  end

  private

  def game_prep
    clear
    display_message(:welcome)
    player_setup
  end

  def player_setup
    @human.name = ask_name(:human) if SETTINGS[:choose_names]
    choose_marker if SETTINGS[:choose_marker]
    @computer.name = ask_name(:computer) if SETTINGS[:choose_names]

    MARKERS.keys.each do |marker| # game engine storing who is who
      MARKERS[marker] = (@human.marker == marker ? @human : @computer)
    end
  end

  def ask_name(player)
    display_message(player == :human ? :ask_name : :ask_cpu_name)
    gets.chomp
  end

  def choose_marker
    prompt "Choose which marker would you like to be: #{joinor(MARKERS.keys)}"
    answer = nil
    loop do
      answer = gets.chomp
      break if MARKERS.keys.include?(answer)
      prompt 'Please choose one of the available markers.'
    end
    return nil unless answer == SETTINGS[:o_marker]
    human.marker = SETTINGS[:o_marker]
    computer.marker = SETTINGS[:x_marker]
  end

  def play_a_round
    clear_screen_and_display_board
    display_round_result
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def play_a_match
    loop do # match loop
      play_a_round
      award_score_point(MARKERS[winning_marker]) if board.someone_won?
      clear
      display_result
      sleep 2
      reset
      break if find_outright_winner.class == Player
    end
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
    switch_player
  end

  def human_moves
    puts "Choose a square between (#{joinor(board.unmarked_keys)})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts 'Sorry, that is not a valid choice.'
    end
    board[square] = @human.marker
  end

  def comp_detects_win_or_threat
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
    square = comp_detects_win_or_threat ||
             (board.centre_free? ? 5 : board.unmarked_keys.sample)
    board[square] = computer.marker
  end

  def human_turn?
    @current_player == :human
  end

  def switch_player
    @current_player = human_turn? ? :computer : :human
  end

  def board_full?
    puts 'The board is full!'
  end

  def winning_marker
    MARKERS.keys.each { |marker| return marker if board.winning?(marker) }
  end

  def award_score_point(player)
    player.increment
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if answer =~ /[yn]/
      puts 'Sorry, answer must be y or n.'
    end
    answer == 'y'
  end

  def reset
    board.reset
    clear
    @current_player = SETTINGS[:first_to_move]
  end
end

game = TTTGame.new
game.play
