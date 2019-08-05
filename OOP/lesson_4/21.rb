# Blackjack specific rules module
module BlackjackRules
  CARD_VALUES = (('2'..'10').to_a + %w(J Q K A)).map(&:freeze)
  CARD_SUITS = %w(H D S C).map(&:freeze)
  WRITTEN_VALUES = CARD_VALUES.zip(%w(two three four five six seven eight nine ten jack queen king ace)).to_h.freeze
  WRITTEN_SUITS = CARD_SUITS.zip(%w(Hearts Diamonds Spades Clubs)).to_h.freeze
  CARDS_TO_START = 2.freeze

  def evaluate # takes the hand's contents, iterates through and scores
    total = contents.inject(0) do |score, card|
      value = card.rank
      score + (value == value.to_i.to_s ? value.to_i : (value == 'A' ? 11 : 10))
    end
    aces = self.contents.map(&:rank).count('A')
    unless aces.zero?
      until total <= 21 || aces.zero?
        aces -=1
        total -= 10
      end
    end
    total
  end

  def blackjack?
    evaluate == 21 && contents.collect(&:rank).count('A') == 1 && contents.size == 2
  end

  def bust?
    evaluate > 21
  end
end
# Generic game display module
module GameDisplay
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
# Individual card class
class Card
  attr_reader :rank, :suit
  def initialize(rank, suit)
    @rank = rank # leave leeway here for a 'happy families' type game?
    @suit = suit
  end

  def to_s
    "{#{rank} #{suit}}"#{Deck::WRITTEN_SUITS[suit]}}"
  end
end
# Participant superclass
class Participant
  attr_accessor :name, :hand, :status
  def initialize
    @hand = Hand.new
    @status = nil
  end

  def hit
    hand.draw(1)
  end

  def stay
  end
  private

  def to_s
    "#{name} has score #{hand.evaluate}"
  end

  def assign_name
    name = ''
    loop do
      puts "=> What is the #{self.class.name}'s name?"
      name = gets.chomp
      break if name.match? /[A-Za-z].*/
    end
    self.name = name
  end
end
# Participant subclasses: dealer
class Dealer < Participant
  def initialize(named = true)
    @name = (named ? assign_name : 'Your Dealer Hal')
    super()
  end

  private

end
# Participant subclasses: player
class Player < Participant
  def initialize(named = true)
    @name = (named ? assign_name : 'Player 1')
    super()
  end

  private

end
# Collection of cards of any size
class CardCollection
  include BlackjackRules
  include GameDisplay
  attr_accessor :contents

  def initialize
    @contents = []
  end

  def <<(card)
    contents << card
  end

  def draw
    contents.pop
  end

  def empty!
    @contents = []
  end

  def to_s
    joinor(contents.map(&:to_s), ', ', 'and')
  end
end
# 1 or more deck sized collection
class Deck < CardCollection
  def initialize(number_of_decks = 1)
    super()
    number_of_decks.times do
      CARD_VALUES.product(CARD_SUITS).each do |card|
        contents << Card.new(*card)
      end
    end
  end

  def deal(player, cards = 2)
    cards.times { player.hand << draw }
  end

  def shuffle!
    contents.shuffle!
  end
end
# Hand
class Hand < CardCollection
  attr_reader :score

  def initialize
    super()
    @score = 0
  end

  def <(other_hand)
    score < other_hand.score
  end

  def >(other_hand)
    score > other_hand.score
  end

  def ==(other_hand)
    score == other_hand.score
  end
end
# Game orchestration engine
class Game
  attr_accessor :deck, :participants, :human, :dealer
  include GameDisplay
  DEALER_TARGET = 17

  def initialize#(players = 1) room for more?
    @participants = Hash.new
    [@human = Player.new, @dealer = Dealer.new].each do |player|
      @participants[player.name] = player
    end
  end

  def start
    loop do
      game_setup
      initialize_deck
      deal_players_in
      display_players_hands(initial_round: true, human_only: false)

      human.status = display_result_of(human, player_turn)
      dealer.status = dealer_turn if human.status == :stick
      round_results

      break unless play_again?
    end
    prompt 'Thanks for playing!'
  end

  private

  def initialize_deck
    self.deck = Deck.new
    deck.shuffle!
  end

  def game_setup
    clear
    reset
    prompt 'Welcome to Blackjack!'
    prompt "---------------------------------- Deal ------------------------------------\n"\
    "   ----------------------------------------------------------------------------".center(74)
    puts
  end

  def reset
    @participants.values.each do |player|
      player.hand.empty!
      player.status = nil
    end
  end

  def deal_players_in
    participants.values.each do |player|
      deck.deal(player)
    end
  end

  def player_sticks?
    answer = nil
    loop do
      prompt 'Would you like to stick or twist (S/T)?'
      answer = gets.chomp
      break if %w(stick twist S T s t).include?(answer)
      prompt "Please enter S or T"
    end
    answer.upcase.start_with?('S')
  end

  def player_twists!
    human.hand << deck.draw
  end
  
  def player_turn
    prompt '------------------------------- User Plays ---------------------------------'
    loop do
      return :blackjack if human.hand.blackjack?
      return :bust if human.hand.bust?
      player_sticks? ? (return :stick) : player_twists!
      display_players_hands(initial_round: false, human_only: true)
    end
  end

  def dealer_turn
    prompt '------------------------------ Dealer Plays --------------------------------'
    loop do
      dealer.hand << deck.draw
      prompt 'Dealer twists!'
      sleep 1
      puts
      break :bust if dealer.hand.bust?
      break :stick if dealer.hand.evaluate >= DEALER_TARGET
    end
  end

  def display_result_of(player, turn_result)
    case turn_result
    when :bust
      display_bust(player)
    when :blackjack
      display_blackjack(player)
    when :stick
      prompt "#{player.name} sticks!"
      puts
    end
    turn_result
  end

  def display_players_hands(initial_round:, human_only:)
    @participants.each_with_object('') do |(name, player), str|
      dealer_turn = player.class == Dealer
      str = initial_round && dealer_turn ? hide_first_card(player.hand.to_s) : "#{player.hand}"
      unless human_only && dealer_turn
        prompt "%<name>s %<card>#{65 - name.size}s \n    %<score>s" % { name: name + ' has: ', card: str, score: player.hand.evaluate}
      end
    end
    puts
  end

  def hide_first_card(str)
    str.sub(/(?<=(?:and ))(.*$)/, '{Unknown card}')
  end

  def round_results
    prompt "-------------------------------- Results -----------------------------------\n"\
    "   ----------------------------------------------------------------------------"
    puts
    display_players_hands(initial_round: false, human_only: false)
    prompt "Final scores:\n " + "\t\t\t%s, \n\t\t\t%s\n" % participants.values
    display_winner
  end
  
  def winner
    participants.values.reject{|p| p.status == :bust}.max_by{ |p| p.hand.evaluate }.name
  end

  def display_winner
    puts (winner.empty? ? "It's a tie!" : "The winner of the round is #{winner}!").center(80)
    puts
  end

  def display_blackjack(player)
    prompt "#{player.name} has blackjack! 21!"
    puts
  end

  def display_bust(player)
    prompt "#{player.name} went bust with a score of #{player.hand.evaluate}. Unlucky!"
    puts
  end

  def play_again?
    answer = nil
    loop do
      prompt 'Play again? (Y/N)'
      answer = gets.chomp
      break if answer =~ /[yn]/i
    end
    answer =~ /[y]/i
  end
end
system 'clear'
game = Game.new
game.start