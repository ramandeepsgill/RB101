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
require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  # system 'clear'
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

computer_wins = 0
player_wins = 0

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
    loop do
      display_board(board)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  when 'c'
    prompt("Computer made the first move. Now it is your turn!")
    loop do
      computer_places_piece!(board)
      display_board(board)
      break if someone_won?(board) || board_full?(board)
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  end
  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    player_wins += 1 if detect_winner(board) == 'Player'
    computer_wins += 1 if detect_winner(board) == 'Computer'
  else
    prompt "It's a tie!"
  end
  prompt "=================="
  prompt "Running Score:"
  prompt "=================="
  prompt "Player Wins: #{player_wins}"
  prompt "Computer Wins: #{computer_wins}"
  prompt "=================="
  if player_wins == 5
    prompt "+++++++++++++++++++++++++++++++"
    prompt "Player is the Grand Winner!"
    prompt "+++++++++++++++++++++++++++++++"
    player_wins = 0
    computer_wins = 0
  elsif computer_wins == 5
    prompt "+++++++++++++++++++++++++++++++"
    prompt "Computer is the Grand Winner!"
    prompt "+++++++++++++++++++++++++++++++"
    player_wins = 0
    computer_wins = 0
  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing tic-tac-toe. Goodbye!"
