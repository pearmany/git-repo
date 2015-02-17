require_relative "BowlingGame"
require "test/unit"
 
class Teststart < Test::Unit::TestCase
  g = Game.new
  g.roll(0)
end