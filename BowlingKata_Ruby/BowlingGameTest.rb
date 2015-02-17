require_relative "BowlingGame"
require "test/unit"
 
class TestGame < Test::Unit::TestCase
  
  def testGutterGame
  g = Game.new
  g.roll(0)
  assert_equal(0, g.score())
  end
  
  def testAllOnes
    g = Game.new
    g.roll(1)
    asser_equal(20, g.score())
  end
  
end