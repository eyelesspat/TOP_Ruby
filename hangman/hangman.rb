require 'json'

class Game
  def initialize
    @current_word = File.read('dictionary.txt').split
                        .select { |word| word.length.between?(5, 12) }.sample.split('')
    @array = @current_word.map { '_' }
    @game_running = true
    @saved_game = nil
    @guesses_left = 10
  end

  def start_game
    load_game if ask_to_load_saved_game
    unless @saved_game_state
      puts 'Starting a new game...'
      puts "Word: #{@array.join(' ')}"
    end
    player_guess
  end

  def player_guess
    while @game_running
      if @guesses_left != 0
        initial_array = @array.dup
        if @array.include?('_')
          puts "Word: #{@array.join(' ')}"

          puts 'Guess a letter:'
          guess = gets.chomp.downcase

          @current_word.each_with_index do |char, index|
            @array[index] = guess if char == guess
          end

          @guesses_left -= 1 if initial_array == @array

          puts "Current guess: #{@array.join(' ')}"
          puts "Guesses left: #{@guesses_left}"

          save_game if ask_to_save_game
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

  def ask_to_save_game
    puts 'Do you want to save the game? (yes/no)'
    answer = gets.chomp.downcase
    answer == 'yes'
  end

  def save_game
    @game_save = {
      current_word: @current_word,
      array: @array,
      game_running: @game_running,
      guesses_left: @guesses_left
    }
    File.open('game_save.json', 'w') do |file|
      file.puts JSON.dump(@game_save)
    end
  end

  def ask_to_load_saved_game
    puts 'Do you want to load a saved game? (yes/no)'
    answer = gets.chomp.downcase
    return false unless answer == 'yes'

    load_game
    true
  end

  def load_game
    if File.exist?('game_save.json')
      saved_data = File.read('game_save.json')
      @saved_game_state = JSON.parse(saved_data, symbolize_names: true)
      @current_word = @saved_game_state[:current_word]
      @array = @saved_game_state[:array]
      @game_running = @saved_game_state[:game_running]
      @guesses_left = @saved_game_state[:guesses_left]
    else
      puts 'No saved game found'
    end
  end
end

game = Game.new
game.start_game
