#so far i don't think i will need to implement images, i think just manipulating quads should be enough. i will be using mouse clicks for user input and have the coordinates of the main tiles set to color strings, so the order of those clicks will mean the order of the selected colors. then i will have that new order saved in an array to be compared with the randomly generated order. 

#i have used the following links for determening what i needed to do so far:
# http://www.libgosu.org/cgi-bin/mwf/topic_show.pl?tid=923
# https://github.com/intridea/ruby_intrigue/blob/master/asteroids/README.rdoc
#http://www.rubydoc.info/github/jlnr/gosu/Gosu/Window#button_down-instance_method
#http://ruby.about.com/od/gosugme/ss/Mouse-And-Keyboard-Input-In-Gosu_4.htm#step-heading


require 'rubygems'
require 'gosu'

class GameWindow < Gosu::Window

  def initialize
    super 260, 260, false, 600
    self.caption = "Simon Game"
    @colors = {"red" => Gosu::Color.argb(0xffff0000), 
              "green" => Gosu::Color.argb(0xff00ff00), 
              "yellow" => Gosu::Color.argb(0xffffff00),
              "blue" => Gosu::Color.argb(0xff0000ff)
              }
    @buttons = ["red", "blue", "green", "yellow"]
    @score_display = Gosu::Font.new(self, 'Arial', 15)
    @x = 20
    @y = 20
    @w = 100
    @h = 100
    @s = 0
    @player = []
    @order = @buttons.sample(1)
  end 
            
  def draw_rect x, y, w, h, c
    draw_quad x, y, c,
              x + w, y, c,
              x, y + h, c,
              x +w, y + h, c, 0
  end
  
    
   
  def update
    return unless @order == @player
    @order = @buttons.sample(@s)
    @s += 1
    @player = []

  end
  
  def draw
    @score_display.draw("Score: #{@s}", 5, 5, 1, 1, 1, Gosu::Color::BLUE)
    @score_display.draw("Order: #{@order}", 120, 5, 1, 1, 1, Gosu::Color::BLUE)
  
    draw_rect @x, @y, @w, @h, @colors[@buttons[0]] 
    draw_rect @x, 130, @w, @h, @colors[@buttons[1]]
    draw_rect 130, @y, @w, @h, @colors[@buttons[2]]  
    draw_rect 130, 130, @w, @h, @colors[@buttons[3]]
    
    if 
      @colors[@order[@s]] == @colors[@buttons[0]]
      draw_rect @x, @y, @w+10, @h+10, @colors[@buttons[0]]
      
    elsif
      @colors[@order[@s]] == @colors[@buttons[1]]
      draw_rect @x, 130, @w+10, @h+10, @colors[@buttons[1]]
      
    elsif
      @colors[@order[@s]] == @colors[@buttons[2]]
      draw_rect 130, @y, @w+10, @h+10, @colors[@buttons[2]]
      
    elsif
      @colors[@order[@s]] == @colors[@buttons[3]]
      draw_rect 130, 130, @w+10, @h+10, @colors[@buttons[3]]
      
  end
end  
 
  def needs_cursor?
    return true
  end
    
def button_down(id)
  case id 
  when Gosu::MsLeft
    if mouse_x > 0 and mouse_x  < 120 and mouse_y > 0 and mouse_y < 120 
      @player << "red"
    elsif mouse_x > 120 and mouse_x < 240 and mouse_y > 0 and mouse_y < 120
      @player << "green"
    elsif mouse_x > 0 and mouse_x < 120 and mouse_y > 120 and mouse_y < 240
      @player << "blue"
    elsif mouse_x > 120 and mouse_x < 240 and mouse_y > 120 and mouse_y < 240
      @player << "yellow"
  end
end
end

  
end #window

window = GameWindow.new
window.show