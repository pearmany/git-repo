require_relative "BowlingGame"
require "test/unit"
 
class TestGame < Test::Unit::TestCase

  def setup
    @g = Game.new
  end
  
  def rollMany(n, pins)
    @i = 0
    while @i < n do
    @i += 1
    @g.roll(pins)
  end
end

  def testGutterGame
    rollMany(20, 0)
    assert_equal(0, @g.score())
  end
  

  def testAllOnes
    rollMany(20, 1)
    assert_equal(20, @g.score())
  end
  
  def testOneSpare
    rollSpare()
    @g.roll(3)
    rollMany(17, 0)
    assert_equal(16, @g.score())
  end
  
  def testOneStrike
    rollSpare(10) #strike
    @g.roll(3)
    @g.roll(4)
    rollMany(16, 0)
    assert_equal(24, @g.score())
  end
  
  def rollSpare()
    @g.roll(5)
    @g.roll(5)
  end
end #class