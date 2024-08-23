require_relative("dictionary")

class Game
  def initialize
    @word = get_random_word
    @guesses_left = 6
    @guesses = []
    @done = false
  end

  def play()
    while @guesses_left > 0 and not(@done)
      puts("Your guesses: " + @guesses.join(", "))
      make_guess
      puts(review_guesses)
      puts(stickman(6 - @guesses_left))
    end
  end

  def get_guess_input()
    puts("Enter your guess >>")
    input_string = gets.chomp.downcase
    #validate input
    until "abcdefghijklmnopqrstuvwxyz".include?(input_string)
      puts("Input must be a single letter. Enter another guess >>")
      input_string = gets.chomp.downcase
    end
    return input_string
  end

  def make_guess()
    guess_input = get_guess_input
    @guesses.push(guess_input)
    #reduce guesses_left
    unless @word.include?(guess_input)
      @guesses_left -= 1
    end
  end

  def review_guesses()
    @done = true
    feedback_string = ""
    @word.each_char do |char|
      if @guesses.include?(char)
        feedback_string += char.upcase + " "
      else
        feedback_string += "_ "
        @done = false
      end
    end
    return feedback_string
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