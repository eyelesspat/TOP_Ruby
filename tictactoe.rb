class PlayGame
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
    @player1 = 'x'
    @player2 = 'o'
    @turn = 1
    @valid_inputs = [0, 1, 2]
  end

  def print_board
    @board.each do |row|
      puts row.join('|')
    end
  end

  def check_score
    # Check rows
    @board.each do |row|
      next unless row.uniq.length == 1 && row[0] != ' '

      @game_over = true
      return 'Player 1 wins!' if row[0] == 'x'

      return 'Player 2 wins!'
    end

    # Check columns
    (0..2).each do |col|
      next unless @board[0][col] == @board[1][col] && @board[1][col] == @board[2][col] && @board[0][col] != ' '

      @game_over = true
      return 'Player 1 wins!' if @board[0][col] == 'x'

      return 'Player 2 wins!'
    end

    # Check diagonals
    if (@board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != ' ') ||
       (@board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[0][2] != ' ')
      @game_over = true
      return 'Player 1 wins!' if @board[1][1] == 'x'

      return 'Player 2 wins!'
    end

    # Check for tie
    if @board.flatten.none? { |cell| cell == ' ' }
      @game_over = true
      return "It's a tie!"
    end

    # If no winner yet
    false
  end

  def game_loop
    loop do
      puts 'Choose your row:'
      @row = gets.chomp.to_i
      if @valid_inputs.include?(@row)
        puts 'Choose your column:'
        @column = gets.chomp.to_i
        if @valid_inputs.include?(@column)
          break if @board[@row][@column] == ' '

          puts 'That position is already taken. Please choose another.'

        else
          puts 'Invalid column input. Please try again.'
        end
      else
        puts 'Invalid row input. Please try again.'
      end
    end
  end

  def player_turn
    @game_over = false
    @valid_inputs = [0, 1, 2]
    while true
      if @turn == 1
        puts 'Player1 turn'
        game_loop

        @board[@row][@column] = @player1
        @turn = 2
      else
        puts 'Player2 turn'
        game_loop

        @board[@row][@column] = @player2

        @turn = 1
      end
      print_board
      result = check_score
      if result
        puts result
        break
      end
    end
  end

  def start_game
    puts 'Welcome to Tic Tac Toe!'
    print_board
    player_turn
    puts 'Game Over'
  end
end

game = PlayGame.new
game.start_game
