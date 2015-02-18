class Game

  def initialize
  @rolls = []
  @currentRoll = 0
  end

  def roll(pins)
    @pins = @currentRoll += pins
    @rolls << @pins
  end

  def score
  @score = @currentRoll
end
  
end #class
