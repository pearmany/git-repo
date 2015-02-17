require_relative "BowlingGame"
require "test/unit"
 
class TestGame < Test::Unit::TestCase

  def setup
    @g = Game.new
  end
  
  def testGutterGame
    @n = 20
    @pins = 0
  20.times do
  @g.roll(@pins)
  end
  assert_equal(0, @g.score())
  end

  def testAllOnes
  20.times do
  @g.roll(1)
  end
  assert_equal(20, @g.score())
  end
  
end