# frozen_string_literal: true

require_relative('dictionary')

class Game
  def initialize
    @word = get_random_word
    @guesses_left = 9
    @guesses = []
    @done = false
  end

  def play
    puts('Load game? (y/n) >>')
    load_game if gets.chomp == 'y'
    while @guesses_left.positive? && !@done
      puts("Your guesses: #{@guesses.join(', ')}")
      break if make_guess == 'save'

      puts(review_guesses)
      puts(stickman(9 - @guesses_left))
    end
  end

  def save_game
    File.delete('save_game.txt') if File.exist?('save_game.txt')
    File.open('save_file.txt', 'w') do |file|
      file.puts(@word)
      file.puts(@guesses)
      file.puts(@guesses_left)
    end
  end

  def load_game
    lines = File.readlines('save_file.txt')
    lines.each_with_index do |line, index|
      if index.zero?
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

  def get_guess_input
    puts('Enter your guess >>')
    input_string = gets.chomp.downcase
    # check if 'save' entered
    if input_string == 'save'
      save_game
      return input_string
    end
    # validate input
    until 'abcdefghijklmnopqrstuvwxyz'.include?(input_string)
      puts('Input must be a single letter. Enter another guess >>')
      input_string = gets.chomp.downcase
    end
    input_string
  end

  def make_guess
    guess_input = get_guess_input
    return 'save' if guess_input == 'save'

    @guesses.push(guess_input)
    # reduce guesses_left
    return if @word.include?(guess_input)

    @guesses_left -= 1
  end

  def review_guesses
    @done = true
    feedback_string = ''
    @word.each_char do |char|
      if @guesses.include?(char)
        feedback_string += "#{char.upcase} "
      else
        feedback_string += '_ '
        @done = false
      end
    end
    feedback_string
  end

  def get_word
    @word
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
    stickmen[guesses]
  end
end
