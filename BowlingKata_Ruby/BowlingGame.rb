class Game

  def initialize
  @score = 0
  @rolls = []
  @currentRoll = 0
  end

  def roll(pins)
    @score += pins
    @rolls[@currentRoll +=1] = pins
  end

  def score
    @score
  end
  
end #class
