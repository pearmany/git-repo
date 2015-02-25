class Game

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @score = 0
    @frame = 0
    frameIndex = 0
    
    while @frame < 10
      if isStrike?(frameIndex)
          @score += 10 + strikeBonus(frameIndex)
          @frameIndex += 1
      elsif isSpare?(frameindex)
          @score += 10 + spareBonus(frameIndex)
          @frameIndex += 2
      else
          @score += sumOfBallsInFrame(frameIndex)
          @frameIndex += 2
      end
      @frame += 1
    end
    @score
  end
  
  def isStrike?(frameIndex)
    @rolls[@frameIndex] == 10
  end
  
  def sumOfBallsInFrame(frameIndex)
    @rolls[@frameIndex] + @rolls[@frameIndex + 1]
  end
  
  def spareBonus(frameIndex)
    @rolls[@frameIndex + 2]
  end
  
  def strikeBonus(frameIndex)
    @rolls[@frameInex + 1] + @rolls[@frameIndex + 2]
  end
  
  def isSpare?(frameIndex)
    @rolls[@frameIndex] + @rolls[@frameIndex + 1] == 10
  end
end #class
