require 'pry'
# define prompts for readability
module Promptable
  def prompt(message)
    puts "=> #{message}"
    message
  end

  def display_message(type)
    prompt case type
           when :welcome
             'Welcome to Rock, Paper, Scissors, Spock, Lizard!'
           when :goodbye
             'Thanks for playing Rock, Paper, Scissors, Spock, Lizard. Goodbye!'
           end
  end
end
# move superclass
class Move
  VALUES = %w(rock paper lizard scissors spock).freeze
  REGEXPS = [/^([r]+)(?:ock)?$/i, /^([p]+)(?:aper)?$/i, /^([l]+)(?:izard)?$/i]\
    + [/^([s]+)(?:cissors)?$/i, /^((?:sp)+)(?:ock)?$/i].freeze
  MOVES = VALUES.zip(REGEXPS).to_h

  def initialize; end

  def self.define_move(choice)
    case choice
    when Move::MOVES['rock'] then Rock.new
    when Move::MOVES['paper'] then Paper.new
    when Move::MOVES['lizard'] then Lizard.new
    when Move::MOVES['scissors'] then Scissors.new
    when Move::MOVES['spock'] then Spock.new
    end
  end

  def rock?
    self.class == Rock
  end

  def paper?
    self.class == Paper
  end

  def scissors?
    self.class == Scissors
  end

  def lizard?
    self.class == Lizard
  end

  def spock?
    self.class == Spock
  end

  def to_s
    self.class.name
  end
end

# rock move class
class Rock < Move
  def >(other)
    other.scissors? || other.lizard?
  end

  def <(other)
    other.paper? || other.spock?
  end
end
# paper move class
class Paper < Move
  def >(other)
    other.rock? || other.spock?
  end

  def <(other)
    other.scissors? || other.lizard?
  end
end
# lizard move class
class Lizard < Move
  def >(other)
    other.spock? || other.paper?
  end

  def <(other)
    other.scissors? || other.rock?
  end
end
# scissors move class
class Scissors < Move
  def >(other)
    other.paper? || other.lizard?
  end

  def <(other)
    other.rock? || other.spock?
  end
end
# spock move class
class Spock < Move
  def >(other)
    other.scissors? || other.rock?
  end

  def <(other)
    other.paper? || other.lizard?
  end
end

# player class
class Player
  attr_accessor :move, :name, :move_history
  include Promptable
  def initialize
    set_name
    @move_history = []
    # Score.new(self.name) (for F.E. #1)
  end

  def record(move)
    move_history << [move.to_s]
  end

  def show_history
    puts @move_history
  end
end
# human specific player
class Human < Player
  def set_name
    n = nil
    loop do
      prompt "What's your name?"
      n = gets.chomp
      break unless n.empty?
      prompt 'Sorry, must enter a value'
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      prompt "Please choose: #{Move::MOVES.keys.join(', ')}"
      choice = gets.chomp
      break if Move::MOVES.values.any? { |regex| choice =~ regex }
      prompt 'Sorry, invalid choice.'
    end
    self.move = Move.define_move(choice)
    record(move)
  end
end
# computer specific player
class Computer < Player
  def set_name
    self.name = %w(R2D2 HAL Chaplin Dave K-meister).sample
  end

  def lucky_streak?
    !move_history.empty? &&
      move_history.last(2).all? { |move| move[1] == 'Win' }
  end

  def choose
    self.move = if lucky_streak?
                  Move.define_move(move_history.last.first)
                else
                  Move.define_move(Move::VALUES.sample)
                end
    record(move)
  end
end

# Game orchestration engine
class RPSGame
  attr_accessor :human, :computer, :scores, :round_winner
  include Promptable

  def initialize
    @human = Human.new
    @computer = Computer.new
    @scores = { @human.name => 0, @computer.name => 0 }
  end

  def display_moves
    prompt "#{human.name} chose #{human.move}"
    prompt "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    h = human.move
    c = computer.move
    prompt(if h > c then "#{human.name} won!"
           elsif h < c then "#{computer.name} won!"
           else "It's a tie!"
           end)
  end

  def return_winner(msg)
    return nil if msg.split.last =~ /tie\!/
    msg.split.first
  end

  def score_moves
    @scores[round_winner] += 1 unless round_winner.nil?
  end

  def display_scores
    prompt "The current scores are #{@scores.values.first} to \
#{@scores.keys.first} : #{@scores.values.last} to #{@scores.keys.last}."
  end

  def register_human_win
    human.move_history.last << 'Win'
    computer.move_history.last << 'Loss'
  end

  def register_human_loss
    human.move_history.last << 'Loss'
    computer.move_history.last << 'Win'
  end

  def register_tie
    human.move_history.last << 'Tie'
    computer.move_history.last << 'Tie'
  end

  def update_move_histories
    if round_winner == human.name
      register_human_win
    elsif round_winner == computer.name
      register_human_loss
    else
      register_tie
    end
  end

  def overall_winner?
    scores.values.any? { |score| score == 10 }
  end

  def display_overall_winner
    puts "#{@scores.keys.select { |name| @scores[name] == 10 }} won the match!"
  end

  def play_again?
    answer = nil
    loop do
      prompt 'Would you like to play again? (Y/N)'
      answer = gets.chomp
      break if answer =~ /[YN]/i
      prompt 'Sorry, must be Y or N.'
    end
    answer =~ /[Y]/i ? true : false
  end

  def start_game
    system 'clear'
    display_message(:welcome)
  end

  def choose_and_display_moves
    human.choose
    computer.choose
    display_moves
  end

  def do_score_processing
    score_moves
    update_move_histories
  end

  def reset_display
    sleep 2
    system 'clear'
    display_scores unless overall_winner?
  end

  def play
    start_game
    loop do
      choose_and_display_moves
      self.round_winner = return_winner(display_winner)
      do_score_processing
      reset_display
      break if overall_winner?
    end
    display_overall_winner
    display_message(:goodbye)
  end
end

#  Bonus Features:
# 1. Using Score as class. I found that the idea of using Score
#  objects as collaborators in the RPSGame class was not particularly helpful,
#  as it seemed to involve using a 'player' attribute for each Score object.
#  This seems backwards to me - the score belongs to the player and not the
#  other way around.
#  I thought about subclassing the Player class but that didn't make sense
#  either since a score is not a type of Player. Below comments is the Score
#  class I wrote, for posterity.

# 2, 3. Adding a class for each move had the result of moving the game logic
#  for comparison into the subclasses which helped with addressing ABC cop
#  issues in Rubocop. Apart from that benefit it didn't seem worth the extra
#  time organising the code and changing the other methods. It would be more
#  useful only if there were to be more type of move added (which seems very)
#  unlikely in this case!

# 4. I chose to add the move's class name to an array for the recording of a
#  player's move. This is stored in an instance variable @move_history in
#  the player class and can be 'puts'd using the 'show_history' instance method
#  at any time.

# 5. The rule I have come up with is: the AI is superstitious! Instead of
#  acting logically, like you'd expect, if the computer player wins 2 games
#  in a row they will automatically keep to the same move until they lose again
#  (believing it is a lucky streak). It is then for the human player to notice
#  this and adjust their play.

# 6. In order to approach this extra feature we would need to create
#  attributes (states) for the individual Computer object that gave them a
#  certain favoritism for different classes of move. We could either instantiate
#  them with a hash/array defining their probability of chossing each move
#  in particular (e.g. {R => 0.2, P => 0.2, L => 0.2, S => 0.2, SP => 0.2, })
#  then adapt the 'choose' instance method to account for weighting.
#   Another option is to just set a favorite_move instance variable and a
#  favorite_move_bias instance variable which could be instantiated to
#  help determine the weight of that particular move against the others.
#  This seems like a simpler and more easily implemented addition.

# class Score
#  @@score_table = []
#  attr_reader :value, :player
#  include Promptable
#
#  def initialize(player, value = 0)
#    @player = player
#    @value = value
#    @@score_table << self
#  end
#
#  def self.score_table
#    @@score_table
#  end
#
#  def self.display
#    puts "The current scores are " +
#    @@score_table.map { |score| "#{score.player} has #{score.value} points\
# , " }.join[0..-3] + "."
#  end
#
#  def increment
#    self.value += 1
#  end
# end

RPSGame.new.play
