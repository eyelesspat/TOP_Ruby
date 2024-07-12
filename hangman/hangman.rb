class Game
  def initialize
    @current_word = File.read('dictionary.txt').split
                        .select { |word| word.length.between?(5, 12) }.sample.split('')
    @array = @current_word.map { '_' }
    @game_running = true
  end

  def start_game
    puts "Word: #{@array.join(' ')}"
    #  puts @current_word.inspect
    #  puts @array.inspect
    player_guess
  end

  def player_guess
    guesses_left = 10
    while @game_running
      if guesses_left != 0
        initial_array = @array.dup
        if @array.include?('_')
          puts 'Guess a letter:'
          guess = gets.chomp.downcase

          @current_word.each_with_index do |char, index|
            @array[index] = guess if char == guess
          end

          guesses_left -= 1 if initial_array == @array

          puts "Current guess: #{@array.join(' ')}"
          puts "Guesses left: #{guesses_left}"
        else
          puts "You won the game! The word was: #{@current_word.join}"
          @game_running = false
        end
      else
        puts "You lost the game! The word was: #{@current_word.join}"
        @game_running = false
      end
    end
  end
end

game = Game.new
game.start_game
