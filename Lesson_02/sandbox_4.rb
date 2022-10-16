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

choice = ''

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
computer_choice = VALID_CHOICES.values().sample()
Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

p VALID_CHOICES[choice.to_sym]