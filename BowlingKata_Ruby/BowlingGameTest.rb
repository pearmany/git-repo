require_relative "BowlingGame"
require "test/unit"
 
class TestGame < Test::Unit::TestCase

  def testGutterGame
  g= Game.new
  20.times do
  g.roll(0)
  end
  assert_equal(0, g.score())
  end

  def testAllOnes
  g= Game.new
  20.times do
  g.roll(1)
  end
  assert_equal(20, g.score())
  end
  
end