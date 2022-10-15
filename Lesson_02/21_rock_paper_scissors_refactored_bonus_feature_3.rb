# Keeping a count for the number of wins
# When either the player or computer reaches 3 wins,
# the match is over, and the winning player becomes the 
# Grand Winner!
# 

VALID_CHOICES = ['rock', 'paper', 'scissors']



def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end

def add_win(player1, player2, player1_wins)
  if win?(player1, player2)
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
  display_results(choice, computer_choice)
  player_wins = add_win(choice, computer_choice, player_wins)
  computer_wins = add_win(computer_choice, choice, computer_wins)
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
