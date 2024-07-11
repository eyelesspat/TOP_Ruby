class PlayGame
  def initialize
    @correct_code = [1, 2, 3, 4]
    @is_playing = false
  end

  def guesses
    puts 'Guess first'
    first_guess = gets.chomp.to_i
    puts 'Guess second'
    second_guess = gets.chomp.to_i
    puts 'Guess third'
    third_guess = gets.chomp.to_i
    puts 'Guess fourth'
    fourth_guess = gets.chomp.to_i

    @player_guess = [first_guess, second_guess, third_guess, fourth_guess]
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
