require_relative "BowlingGame"
require "test/unit"
 
class TestGame < Test::Unit::TestCase

  def setup
    @g = Game.new
  end
  
  def testGutterGame
    rollMany(20, 0)
    assert_equal(0, @g.score())
  end
  
  def rollMany(n, pins)
    @i = 0
    while @i < n do
    @i += 1
    @g.roll(pins)
  end
end

  def testAllOnes
    rollMany(20, 1)
    assert_equal(20, @g.score())
  end
  
end