=begin

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

=end
require 'pry'

def prompt(message)
    puts "=> #{message}"
end

def initialize_deck
  num_cards_clubs = []
  num_cards_diamonds = []
  num_cards_hearts = []
  num_cards_spades = []
  
  (2..10).each do |elem|
    num_cards_clubs << [elem.to_s, 'C']
    num_cards_diamonds << [elem.to_s, 'D']
    num_cards_hearts << [elem.to_s, 'H']
    num_cards_spades << [elem.to_s, 'S']
  end
  
  face_cards_clubs = []
  face_cards_diamonds = []
  face_cards_hearts = []
  face_cards_spades = []
  
  ["J", "Q", "K"].each do |elem|
    face_cards_clubs << [elem, 'C']
    face_cards_diamonds << [elem, 'D']
    face_cards_hearts << [elem,  'H']
    face_cards_spades << [elem,  'S']
  end
  
  ace_card_clubs = []
  ace_card_diamonds = []
  ace_card_hearts = []
  ace_card_spades = []
  
  ["A"].each do |elem|
    ace_card_clubs << [elem, 'C']
    ace_card_diamonds << [elem, 'D']
    ace_card_hearts << [elem,  'H']
    ace_card_spades << [elem,  'S']
  end
  
  ace_card_clubs + num_cards_clubs + face_cards_clubs + ace_card_diamonds + num_cards_diamonds + face_cards_diamonds + ace_card_hearts + num_cards_hearts + face_cards_hearts + ace_card_spades + num_cards_spades + face_cards_spades
  
#   ace_card_clubs + num_cards_clubs + face_cards_clubs
end

def deal(card_deck)
    card_deck.sample(2)
end

def hit(card_deck)
  card_deck.sample
end

def update_deck(card_deck, cards_dealt)
  cards_dealt.each do |card|
    card_deck.delete(card)
  end
  card_deck
end

def display_hand(hand, plyr)
  string = ""
  last_card_index = hand.size - 1
  if plyr == "player"
    string = string + "Your hand is "
  else
    string = string + "Dealer hand is "
  end
  
  hand.each_with_index do |card, card_index|
    case card[0]
    when "A"
      num_or_face = "Ace"
    when "J"
      num_or_face = "Jack" 
    when "Q"
      num_or_face = "Queen"
    when "K"
      num_or_face = "King"
    else 
      num_or_face = card[0]
    end
    
    case card[1]
    when "C"
      suit = "Clubs"
    when "D"
      suit = "Diamonds" 
    when "H"
      suit = "Hearts"
    when "S"
      suit = "Spades"
    end
    
    if card_index != last_card_index
      string = string + "#{num_or_face} of #{suit}, "
    else
      string = string + "and #{num_or_face} of #{suit}."
    end
  end
  string
end

def total(cards)
  # cards = [['3', 'H'], ['Q', 'S'], ... ]
  values = cards.map { |card| card[0] }

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
    sum -= 10 if sum > 21
  end

  sum
end

def face_and_ace?(hand)
  values = hand.map { |card| card[0] }
  check1 = values.all? { |value| value.to_i == 0 }
  check2 = values.select { |value| value == 'A'}.count
  final_check = check1 && check2 == 1
  if final_check
    true
  else
    false
  end
end

def show_dealer_card(hand)
  if face_and_ace?(hand)
    hand.sort[1]
  else
    hand.sort[0]
  end
end

def busted?(hand)
  if total(hand) > 21
    true
  else
    nil
  end
end

def compare_cards(plyr_hand, dlr_hand)
  if total(plyr_hand) > total(dlr_hand)
    'Player'
  else
    'Dealer'
  end
end

# Playing 21

loop do

  deck = initialize_deck
  # p "initial deck is #{deck}"
  # p "initial deck count is #{deck.count}"
  
  player_hand = deal(deck)
  deck = update_deck(deck, player_hand)
  prompt(display_hand(player_hand, 'player'))
  
  # dealer_hand = deal(deck)
  dealer_hand = [['4', 'C'], ['4', 'D']]
  deck = update_deck(deck, dealer_hand)
  prompt(display_hand(dealer_hand, 'dealer'))
  
  # show one dealer card
  p show_dealer_card(dealer_hand)
  
  answer = nil
  loop do
    prompt("hit or stay?")
    answer = gets.chomp
    if answer == 'hit'
      player_hand << hit(deck)
      deck = update_deck(deck, player_hand)
    end
    break if answer == 'stay' || busted?(player_hand)
  end
  
  if busted?(player_hand)
    prompt(display_hand(player_hand, 'player'))
    prompt("Since your card total is more than 21, Dealer won!")
    prompt("Do you want to play again? 'yes' or 'no'")
    answer = gets.chomp
    break if answer.downcase == 'no'
  else
    prompt("You chose to stay")
    prompt(display_hand(player_hand, 'player'))
  end
  
  # Dealer Turn
  prompt("Now it is the Dealer's turn!")
  
  loop do
    break if total(dealer_hand) > total(player_hand) || \
             busted?(dealer_hand) || \
             total(dealer_hand) > 17
    prompt("Since the Dealer total is less than 17, Dealer needs to hit ...")
    dealer_hand << hit(deck)
    # dealer_hand << ['10', 'S']
    deck = update_deck(deck, dealer_hand)
    p deck.count
    prompt(display_hand(dealer_hand, 'dealer'))
  end
  
  prompt(display_hand(dealer_hand, 'dealer'))
  prompt("Dealer total is #{total(dealer_hand)}")
  prompt(display_hand(dealer_hand, 'player'))
  prompt("Player total is #{total(player_hand)}")
  
  if total(dealer_hand) > total(player_hand)
    prompt("Dealer won!")
    prompt("Do you want to play again? 'yes' or 'no'")
    answer = gets.chomp
    break if answer.downcase == 'no'
  end
  
  if busted?(dealer_hand)
    prompt("Player won")
    puts "Do you want to play again? 'yes' or 'no'"
    answer = gets.chomp
    break if answer.downcase == 'no'
  end
  
  # If Dealer Total is > 17
  
  loop do
    prompt("'hit' or 'stay'?")
    answer = gets.chomp
    if answer == 'hit'
      dealer_hand << hit(deck)
      deck = update_deck(deck, dealer_hand)
      p deck.count
      p dealer_hand
    end
    break if answer == 'stay' || busted?(dealer_hand) 
  end
  
  if busted?(dealer_hand)
    prompt("Player won")
    puts "Do you want to play again? 'yes' or 'no'"
    answer = gets.chomp
    break if answer.downcase == 'no'
  else
    prompt("The Dealer chose to stay.")
    prompt("Let's compare cards.")
    prompt("#{compare_cards(player_hand, dealer_hand)} is the Winner!")
    puts "Do you want to play again? 'yes' or 'no'"
    answer = gets.chomp
    break if answer.downcase == 'no'
  end
end

puts "Thank You for playing!"
