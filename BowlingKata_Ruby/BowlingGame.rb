class Game

  def initialize
  @rolls = []
  @currentRoll = 0
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @score = 0
    @rolls.each do |x|
    @score += x
    end
    @score
  end
end #class
