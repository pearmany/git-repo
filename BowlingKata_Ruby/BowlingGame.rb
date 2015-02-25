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
    @frame = 0
    @frameIndex = 0
    
    while @frame < 10
      if @rolls[@frameIndex] + @rolls[@frameIndex + 1] == 10
        @score += 10 + @rolls[@frameIndex + 2]
        @frameIndex += 2
      else
        @score += @rolls[@frameIndex] + @rolls[@frameIndex +1]
        @frameIndex += 2
      end
      @frame += 1
    end
    @score
  end
end #class
