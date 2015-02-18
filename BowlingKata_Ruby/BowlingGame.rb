class Game

  def initialize
  @score = 0
  @rolls = []
  @currentRoll = 0
  end

  def roll(pins)
    @pins = @score += pins
    @rolls << @pins
  end

  def score
  @score
end
  
end #class
