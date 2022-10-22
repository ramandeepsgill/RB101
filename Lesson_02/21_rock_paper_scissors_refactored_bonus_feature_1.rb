# Keeping a count for the number of wins
# When either the player or computer reaches 3 wins,
# the match is over, and the winning player becomes the 
# Grand Winner!
# 
# VALID_CHOICES = ['rock', 'paper', 'scissors']

VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

WIN_OPTIONS = { 'lizard': ['paper', 'spock'],
                  'paper': ['rock', 'spock'],
                  'rock': ['lizard', 'scissors'],
                  'scissors': ['lizard', 'paper'],
                  'spock': ['rock', 'scissors']}

def prompt(message)
  Kernel.puts("=> #{message}")
end

# def win?(first, second)
#   (first == 'rock' && second == 'scissors') ||
#     (first == 'paper' && second == 'rock') ||
#     (first == 'scissors' && second == 'paper')
# end

def win?(player1_choice, player2_choice, win_options_hash)
  win_options_hash[player1_choice.to_sym].include?(player2_choice)
end

def display_results(player, computer, win_options_hash)
  if win?(player, computer, win_options_hash)
    prompt("You Won!")
  elsif win?(computer, player, win_options_hash)
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end

def add_win(player1, player2, player1_wins, win_options_hash)
  if win?(player1, player2, win_options_hash)
    player1_wins + 1
  else
    player1_wins
  end
end

player_wins = 0
computer_wins = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample()
  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")
  display_results(choice, computer_choice, WIN_OPTIONS)
  player_wins = add_win(choice, computer_choice, player_wins, WIN_OPTIONS)
  computer_wins = add_win(computer_choice, choice, computer_wins, WIN_OPTIONS)
  prompt("your wins: #{player_wins}")
  prompt("computer wins: #{computer_wins}")
  if player_wins == 3
    prompt("============================")
    prompt("You are the Grand Winner!")
    prompt("============================")
    player_wins = 0
    computer_wins = 0
  elsif computer_wins == 3
    prompt("===============================")
    prompt("Computer is the Grand Winner!")
    prompt("===============================")
    computer_wins = 0
    player_wins = 0
  end
  prompt("Do you want to play again?")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
