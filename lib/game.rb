require_relative("dictionary")

class Game
  def initialize
    @word = get_random_word
  end

  def get_word
    return @word
  end
end