SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WINS_TO_BE_GRAND_WINNER = 5
GAME_TARGET_SCORE = 21
DEALER_HITS_TILL = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end
  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > GAME_TARGET_SCORE
  end

  sum
end

def busted?(total)
  total > GAME_TARGET_SCORE
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_total, player_total)
  if player_total > GAME_TARGET_SCORE
    :player_busted
  elsif dealer_total > GAME_TARGET_SCORE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards, dealer_total, player_total)
  result = detect_result(dealer_total, player_total)
  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts "=============="
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def update_match_score(
  player_total,
  dealer_total,
  player_wins,
  dealer_wins,
  no_of_ties
)
  result = detect_result(dealer_total, player_total)
  case result
  when :player_busted
    dealer_wins += 1
  when :dealer_busted
    player_wins += 1
  when :player
    player_wins += 1
  when :dealer
    dealer_wins += 1
  when :tie
    no_of_ties += 1
  end
  [player_wins, dealer_wins, no_of_ties]
end

def match_score(player_wins, dealer_wins, no_of_ties)
  prompt("===============")
  prompt("Match Score:")
  prompt("===============")
  prompt("Player Wins: #{player_wins}")
  prompt("Dealer Wins: #{dealer_wins}")
  prompt("Ties: #{no_of_ties}")
  prompt("===============")
end

def grand_winner?(player_wins, dealer_wins)
  if player_wins == WINS_TO_BE_GRAND_WINNER
    'Player'
  elsif dealer_wins == WINS_TO_BE_GRAND_WINNER
    'Dealer'
  else
    nil
  end
end

def display_grand_winner(player_wins, dealer_wins)
  prompt("+++++++++++++++++++++++++++")
  prompt("#{grand_winner?(player_wins, dealer_wins)} is the GRAND WINNER!")
  prompt("+++++++++++++++++++++++++++")
end

def reset_match_score(player_wins, dealer_wins, no_of_ties)
  if player_wins == WINS_TO_BE_GRAND_WINNER ||
     dealer_wins == WINS_TO_BE_GRAND_WINNER
    player_wins = 0
    dealer_wins = 0
    no_of_ties = 0
    [player_wins, dealer_wins, no_of_ties]
  else
    [player_wins, dealer_wins, no_of_ties]
  end
end

player_wins = 0
dealer_wins = 0
no_of_ties = 0

system 'clear'
prompt("######################################")
prompt("Welcome to #{GAME_TARGET_SCORE}!")
prompt("First to 5 wins is the Grand Winner!")
prompt("######################################")

loop do
  # initialize vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  # initial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
  player_total = total(player_cards) # 1 call
  dealer_total = total(dealer_cards) # 2 call
  prompt("Dealer has #{dealer_cards[0]} and ?")
  prompt("You have: #{player_cards[0]} and #{player_cards[1]},
    for a total of #{player_total}.") # 1 cache
  # player turn
  loop do
    player_turn = nil
    loop do
      prompt("Would you like to (h)it or (s)tay?")
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt("Sorry, must enter 'h' or 's'.")
    end
    if player_turn == 'h'
      player_cards << deck.pop
      prompt("You chose to hit!")
      prompt("Your cards are now: #{player_cards}")
      player_total = total(player_cards) # 3 call
      prompt("Your total is now: #{player_total}") # 2 cache
    end
    break if player_turn == 's' || busted?(player_total) # 3 cache
  end

  if busted?(player_total) # 4 cache
    display_result(dealer_cards, player_cards, dealer_total, player_total)
    player_wins, dealer_wins, no_of_ties = update_match_score(
      player_total,
      dealer_total,
      player_wins,
      dealer_wins,
      no_of_ties
    )
    match_score(player_wins, dealer_wins, no_of_ties)
    if grand_winner?(player_wins, dealer_wins)
      display_grand_winner(player_wins, dealer_wins)
      player_wins, dealer_wins, no_of_ties = reset_match_score(
        player_wins,
        dealer_wins,
        no_of_ties
      )
    end
    play_again? ? next : break
  else
    prompt("You stayed at #{player_total}") # 6 cache
  end
  # dealer turn
  prompt("Dealer turn...")
  loop do
    break if dealer_total >= DEALER_HITS_TILL
    prompt("Dealer hits!")
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards) # 4 call
    prompt("Dealer's cards are now: #{dealer_cards}")
  end
  if busted?(dealer_total) # 7 cache
    prompt("Dealer total is now: #{dealer_total}") # 8 cache
    display_result(dealer_cards, player_cards, dealer_total, player_total)
    player_wins, dealer_wins, no_of_ties = update_match_score(
      player_total,
      dealer_total,
      player_wins,
      dealer_wins,
      no_of_ties
    )
    match_score(player_wins, dealer_wins, no_of_ties)
    if grand_winner?(player_wins, dealer_wins)
      display_grand_winner(player_wins, dealer_wins)
      player_wins, dealer_wins, no_of_ties = reset_match_score(
        player_wins,
        dealer_wins,
        no_of_ties
      )
    end
    play_again? ? next : break
  else
    prompt("Dealer stays at #{dealer_total}") # 10 cache
  end
  display_result(dealer_cards, player_cards, dealer_total, player_total)
  player_wins, dealer_wins, no_of_ties = update_match_score(
    player_total,
    dealer_total,
    player_wins,
    dealer_wins,
    no_of_ties
  )
  match_score(player_wins, dealer_wins, no_of_ties)
  if grand_winner?(player_wins, dealer_wins)
    display_grand_winner(player_wins, dealer_wins)
    player_wins, dealer_wins, no_of_ties = reset_match_score(
      player_wins,
      dealer_wins,
      no_of_ties
    )
  end
  break unless play_again?
end
prompt("Thank you for playing Twenty-One! Good bye!")
