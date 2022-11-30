=begin

1. Display the initial empty 3X3 board
2. Ask the user to mark a square
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2.
8. Play again?
9. if yes, go to #1.
10. if no, Goodbye!

=end
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINS_TO_BE_GRAND_WINNER = 5

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Your turn!"
    prompt "Choose a square (#{joinor(empty_squares(brd))}): "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

# rubocop:disable Style/EmptyElse
def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def find_offensive_square(line, board)
  if board.values_at(*line).count(COMPUTER_MARKER) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end
# rubocop:enable Style/EmptyElse

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_offensive_square(line, brd)
    break if square
  end
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd)
      break if square
    end
  end
  if !square
    if brd[5] == INITIAL_MARKER
      square = 5
    end
  end
  if !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def who_chooses?
  loop do
    prompt("Who decides who plays first?")
    prompt("Enter 'c' for 'computer, or 'p' for 'player':")
    input_from_prompt = gets.chomp.downcase
    if input_from_prompt == 'p' || input_from_prompt == 'c'
      return input_from_prompt
    else
      prompt("Not a valid choice.")
    end
  end
end

def player_chose
  loop do
    prompt("Who goes first? Choose 'c' for computer or 'p' for player:")
    input_from_prompt = gets.chomp.downcase
    if input_from_prompt == 'p' || input_from_prompt == 'c'
      return input_from_prompt
    else
      prompt("Not a valid choice.")
    end
  end
end

def computer_chose
  ['p', 'c'].sample
end

def place_piece!(brd, curr_player)
  player_places_piece!(brd) if curr_player == 'player'
  computer_places_piece!(brd) if curr_player == 'computer'
end

def alternate_player(curr_player)
  return 'player' if curr_player == 'computer'
  return 'computer' if curr_player == 'player'
end

def grand_winner?(plyr_wins, cmptr_wins)
  if plyr_wins == WINS_TO_BE_GRAND_WINNER
    'Player'
  elsif cmptr_wins == WINS_TO_BE_GRAND_WINNER
    'Computer'
  end
end

system 'clear'
prompt("+++++++++++++++++++++++++++++++++++++++++++++++++++++")
prompt("Wecome to Tic-Tac-Toe!")
prompt("You are going to be playing against Me, THE COMPUTER!")
prompt("First to reach 5 wins is the GRAND WINNER!")
prompt("Let get started!")
prompt("+++++++++++++++++++++++++++++++++++++++++++++++++++++")

computer_wins = 0
player_wins = 0
no_of_ties = 0

loop do
  board = initialize_board
  chooser = who_chooses?
  case chooser
  when "c"
    choice = computer_chose
  when "p"
    choice = player_chose
  end
  case choice
  when 'p'
    prompt("Player makes the first move!")
    sleep(1)
    current_player = 'player'
  when 'c'
    prompt("Computer makes the first move!")
    sleep(1)
    current_player = 'computer'
  end
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    player_wins += 1 if detect_winner(board) == 'Player'
    computer_wins += 1 if detect_winner(board) == 'Computer'
  else
    prompt "It's a tie!"
    no_of_ties += 1
  end
  prompt "=================="
  prompt "Running Score:"
  prompt "=================="
  prompt "Player Wins: #{player_wins}"
  prompt "Computer Wins: #{computer_wins}"
  prompt "Ties: #{no_of_ties}"
  prompt "=================="
  if player_wins == WINS_TO_BE_GRAND_WINNER || \
     computer_wins == WINS_TO_BE_GRAND_WINNER
    prompt "+++++++++++++++++++++++++++++++"
    prompt "#{grand_winner?(player_wins, computer_wins)} is the Grand Winner!"
    prompt "+++++++++++++++++++++++++++++++"
    player_wins = 0
    computer_wins = 0
    no_of_ties = 0
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic-tac-toe. Goodbye!"
