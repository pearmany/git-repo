require_relative "BowlingGame"
require "test/unit"
 
class TestGame < Test::Unit::TestCase

  def setup
    @g = Game.new
  end
  
  def testGutterGame
    @n = 20
    @pins = 0
  rollMany(@n, @pins)
  assert_equal(0, @g.score())
  end
  
  def rollMany(n, pins)
    @i = 0
    while @i < @n do
      @i += 1
    @g.roll(@pins)
  end
end

  def testAllOnes
  20.times do
  @g.roll(1)
  end
  assert_equal(20, @g.score())
  end
  
end