require_relative("dictionary")

class Game
  def initialize
    @word = get_random_word
    @guesses_left = 6
    @guesses = []
  end

  def get_guess_input()
    puts("Enter your guess >>")
    input_string = gets.chomp.downcase
    #validate input
    until DICTIONARY.include?(input_string)
      puts("Your input is not one of our words. Enter another guess >>")
      input_string = gets.chomp.downcase
    end
    puts(input_string)
  end

  def get_word
    return @word
  end

  def stickman(guesses)
    stickmen = ["____
|/   |
|   
|    
|    
|    
|
|_____",
"____
|/   |
|   (_)
|    
|    
|    
|
|_____",
"____
|/   |
|   (_)
|    |
|    |    
|    
|
|_____",
" ____
|/   |
|   (_)
|   \|
|    |
|    
|
|_____",
" ____
|/   |
|   (_)
|   \|/
|    |
|    
|
|_____",
" ____
|/   |
|   (_)
|   \|/
|    |
|   / 
|
|_____",
"____
|/   |
|   (_)
|   \|/
|    |
|   / \
|
|_____"]
    return stickmen[guesses]
  end
end