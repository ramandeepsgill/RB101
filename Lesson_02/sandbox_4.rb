VALID_CHOICES = {r: 'rock', p: 'paper', s: 'scissors', l: 'lizard', sp: 'spock'}

win_options = { 'lizard': ['paper', 'spock'],
                  'paper': ['rock', 'spock'],
                  'rock': ['lizard', 'scissors'],
                  'scissors': ['lizard', 'paper'],
                  'spock': ['rock', 'scissors']}

def prompt(message)
  Kernel.puts("=> #{message}")
end

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

choice = ''

player_wins = 0
computer_wins = 0

loop do 

  loop do
      # prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      prompt("Choose one: ")
      choice = Kernel.gets().chomp()
      if VALID_CHOICES.has_key?(choice.to_sym)
        break
      else
        prompt("That's not a valid choice.")
      end
  end
  player_choice = VALID_CHOICES[choice.to_sym]
  computer_choice = VALID_CHOICES.values().sample()
  # Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")
  Kernel.puts("You chose: #{player_choice}; Computer chose: #{computer_choice}")
  display_results(player_choice, computer_choice, win_options)
  player_wins = add_win(player_choice, computer_choice, player_wins, win_options)
  computer_wins = add_win(computer_choice, player_choice, computer_wins, win_options)
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