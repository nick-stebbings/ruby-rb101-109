CARD_VALUES = (('2'..'10').to_a + %w(J Q K A)).map(&:freeze)
CARD_SUITS = %w(H D S C).map(&:freeze)
MAX_SCORE = 21
DEALER_TARGET = 17
def prompt(message)
  puts "=> #{message}"
end

def card_value(card)
  card[0]
end

def joinor(array, delimiter = ', ', final = 'and')
  return array.join(" #{final} ") if array.size <= 2
  last_el_spacing = array.last.size + 1
  array.join(delimiter).insert(-last_el_spacing, "#{final} ")
end

def deal_cards
  hands = [:player, :dealer].zip([[], []]).to_h
  hands.keys.each do |player_symbol|
    draw_n_cards!(hands, player_symbol, 2)
  end
  hands
end

def draw_card
  [CARD_VALUES.sample.dup] << CARD_SUITS.sample.dup
end

def draw_n_cards!(all_hands, player, n = 1)
  new_hand_size = all_hands[player].size + n
  until all_hands[player].size == new_hand_size
    card = draw_card
    unless all_hands.values.flatten(1).any? { |in_hands| card == in_hands }
      all_hands[player].push(card) # Add to hand if not a duplicate
    end
  end
end

def evaluate_hand(hand)
  total = hand.inject(0) do |score, card|
    value = card[0]
    if value == value.to_i.to_s
      score + value.to_i
    else
      score + (value == 'A' ? 11 : 10)
    end
  end
  hand.flatten.count('A').zero? ? total : score_aces(hand, total)
end

def score_aces(hand, score)
  aces = hand.flatten.count('A')
  while score > MAX_SCORE
    break if aces.zero?
    score -= 10
    aces -= 1
  end
  score
end

def user_twists!(hands)
  draw_n_cards!(hands, :player)
  display_cards(hands, true) unless bust?(hands[:player])
  prompt "Your score is #{evaluate_hand(hands[:player])}"
end

def user_sticks?
  answer = nil
  loop do
    prompt 'Would you like to stick or twist (S/T)?'
    answer = gets.chomp
    break if %w(stick twist S T s t).include?(answer)
  end
  answer.upcase.start_with?('S') # Check the first character
end

def bust?(hand)
  evaluate_hand(hand) > MAX_SCORE
end

def display_bust(hands, hand)
  prompt "#{hands.key(hand).to_s.capitalize} went bust!"
end

def blackjack?(hand)
  evaluate_hand(hand) == MAX_SCORE && hand.size == 2
end

def display_cards(hands, first_round = false)
  dealer_second = (first_round ? 'unknown card' : hands[:dealer][1].join)
  hide_second = hands[:dealer].each_with_index.map do |c, i|
    i == 1 ? dealer_second : c.join
  end
  prompt "Dealer has: #{joinor(hide_second)}"
  prompt "You have: #{joinor(hands[:player].map(&:join))}"
end

def winning_hands(hands)
  valid_hands = hands.values.reject { |h| bust?(h) }
  valid_hands.group_by { |h| evaluate_hand(h) }.max[1]
end

def get_winner(hands)
  winning_hands = winning_hands(hands)
  if winning_hands.size > 1 # If more than 1 scored the maximum valid...
    blackjacks = winning_hands.select { |h| blackjack?(h) }
    # One has blackjack, so return winner...
    return hands.key(blackjacks.first) if blackjacks.size == 1
    %s(push) # Both hands are worth the same - return 'push'
  else
    hands.key(winning_hands.first) # Else return winning player
  end
end

def display_winner(hands)
  winner = get_winner(hands)
  if hands.keys.include?(winner)
    hand = hands[winner]
    prompt 'Blackjack!' if blackjack?(hand)
    prompt "#{winner.to_s.capitalize} wins, with a hand scoring \
#{evaluate_hand(hand)}"
  else
    prompt "It's a tie!"
  end
end

def play_again?
  prompt 'Play again? (Y/N)'
  answer = gets.chomp
  answer =~ /[yY]/
end

loop do
  system 'clear'
  prompt 'Welcome to Blackjack!'
  prompt '------------------ Deal ------------------'
  hands = deal_cards
  player_hand, dealer_hand = hands.values
  player_bust = nil
  display_cards(hands, true)
  prompt '--------------- User Plays ---------------'
  loop do
    break if blackjack?(player_hand)
    user_sticks? ? break : user_twists!(hands)
    player_bust = bust?(player_hand)
    break display_bust(hands, player_hand) if player_bust
  end
  prompt '-------------- Dealer Plays --------------' unless player_bust
  loop do
    break if player_bust || blackjack?(player_hand)
    draw_n_cards!(hands, :dealer)
    prompt 'Dealer twists!'
    break display_bust(hands, dealer_hand) if bust?(dealer_hand)
    break if evaluate_hand(dealer_hand) >= DEALER_TARGET
  end
  prompt '---------------- Results -----------------'
  display_cards(hands, false)
  display_winner(hands)
  break unless play_again?
end
prompt 'Thanks for playing!'
