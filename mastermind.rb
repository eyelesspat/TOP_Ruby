class PlayGame
  def initialize
    @correct_code = Array.new(4) { rand(10) }
    @is_playing = false
  end

  def guesses
    @player_guess = []
    puts 'Guess'
    4.times do |_i|
      loop do
        guess = gets.chomp.to_i

        if (0..9).include?(guess)
          @player_guess.push(guess)
          break
        else
          puts 'Invalid input'
        end
      end
    end
  end

  def start_game
    @is_playing = true
    while @is_playing
      guesses
      check_score
    end
  end

  def check_score
    exact_matches = 0
    partial_matches = 0

    # Check for matches
    @correct_code.each_with_index do |num, index|
      exact_matches += 1 if @player_guess[index] == num
      partial_matches += 1 if @player_guess.include?(num) && @player_guess[index] != num
    end

    if exact_matches == @correct_code.size
      puts 'Code guessed!'
      @is_playing = false
    else
      puts "Exact matches: #{exact_matches}, Partial matches: #{partial_matches}"
      puts 'Try again!'
    end
  end
end

game = PlayGame.new
game.start_game
