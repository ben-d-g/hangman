require_relative("dictionary")

class Game
  def initialize
    @word = get_random_word
    @guesses = 8
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
    puts(stickmen.length)
    return stickmen[guesses]
  end
end