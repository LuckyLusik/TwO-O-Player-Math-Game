class Player

  attr_reader :name, :score
  # attr_accessor :score

  MAX_SCORE = 3

  def initialize name
    @name = name
    @score = MAX_SCORE
  end

  def lost_life
    @score -= 1
  end

end
