require_relative("dictionary")

class Game
  def initialize
    @word = get_random_word
    @guesses_left = 9
    @guesses = []
    @done = false
  end

  def play()
    puts("Load game? (y/n) >>")
    if gets.chomp == "y"
      load_game
    end
    while @guesses_left > 0 and not(@done)
      puts("Your guesses: " + @guesses.join(", "))
      if make_guess == "save"
        break
      end
      puts(review_guesses)
      puts(stickman(9 - @guesses_left))
    end
  end

  def save_game()
    if File.exist?("save_game.txt")
      File.delete("save_game.txt")
    end
    File.open("save_file.txt", "w") do |file|
      file.puts(@word)
      file.puts(@guesses)
      file.puts(@guesses_left)
    end
  end

  def load_game()
    lines = File.readlines("save_file.txt")
    lines.each_with_index do |line, index|
      if index == 0
        @word = line
      elsif index == lines.length - 1
        @guesses_left = line.to_i
      else
        @guesses.push(line[0])
      end
    end
    puts(review_guesses)
    puts(stickman(9 - @guesses_left))
  end

  def get_guess_input()
    puts("Enter your guess >>")
    input_string = gets.chomp.downcase
    #check if 'save' entered
    if input_string == "save"
      save_game
      return input_string
    end
    #validate input
    until "abcdefghijklmnopqrstuvwxyz".include?(input_string)
      puts("Input must be a single letter. Enter another guess >>")
      input_string = gets.chomp.downcase
    end
    return input_string
  end

  def make_guess()
    guess_input = get_guess_input
    if guess_input == "save"
      return "save"
    end
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
    stickmen = ["    
      
    
     
     
     
 
      ",
"    
      
    
     
     
     
 
 _____",
"    
|/   
|   
|    
|    
|    
|
|_____",
"____
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
|   -|
|    |
|    
|
|_____",
" ____
|/   |
|   (_)
|   -|-
|    |
|    
|
|_____",
" ____
|/   |
|   (_)
|   -|-
|    |
|   | 
|
|_____",
"____
|/   |
|   (_)
|   -|-
|    |
|   | |
|
|_____"]
    return stickmen[guesses]
  end
end