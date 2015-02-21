class Game

  def initialize
    @score = 0
    @rolls = []
    @currentRoll = 0
  end

  def roll(pins)
    @score += pins
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
