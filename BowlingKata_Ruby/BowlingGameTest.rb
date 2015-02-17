require_relative "BowlingGame"
require "test/unit"
 
class Teststart < Test::Unit::TestCase
  
  def test_start
  g = Game.new
  g.roll(0)
  assert_equal(0, g.score())
  end
  
end