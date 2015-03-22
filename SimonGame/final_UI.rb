require 'rubygems'
require 'gosu'

class GameWindow < Gosu::Window

  def initialize
    super 260, 260, false, 1600
    self.caption = "Simon Game"
    @colors = {"red" => Gosu::Color.argb(0xffff0000), 
              "green" => Gosu::Color.argb(0xff00ff00), 
              "yellow" => Gosu::Color.argb(0xffffff00),
              "blue" => Gosu::Color.argb(0xff0000ff)
              }
              
    @buttons = ["red", "blue", "green", "yellow"]
    @display = Gosu::Font.new(self, 'Arial', 15)
    @messages = ["MUCH WOW!", "Good Job!", "Keep Going!", "Very Memory!"]
    @x = 30
    @y = 40
    @w = 95
    @h = 95
    @n = 0
    @s = 0
    @t = 0
    @c = nil
    @msg = "Here We Go!"
    @player = []
    @order = @buttons.sample(@s)
    @status = "Please Press Space when ready!"
  end
    
    def update
      @order = @buttons.sample(@s) and return if @t == 0
      @n += 1 unless @c != nil 
      next_level
      end_game
    end
    
    def end_game
      return unless @order.length == @player.length and @order != @player
      game_over
      end
    
    def next_level
      return unless @order == @player
      @player = []
      @n = 0
      @c = nil
      @order = @buttons.sample(@s += 1)
      @msg = @messages.sample if @s >= 2
    end
    
    def game_over
      @player =[]
      @order =[]
      @status = "Sorry, Press Space To Play Again!"
      @msg = "Here We Go!"
      @s = 0
      @n = 0
      @c = nil
      @t = 0
    end
      
    
    def draw_rect x, y, w, h, c
      draw_quad x, y, c,
                x + w, y, c,
                x, y + h, c,
                x +w, y + h, c, 0
    end 
    
      
    def red_square
      draw_rect @x, @y, @w, @h, @colors[@buttons[0]] if @c != "red"
      draw_rect @x, @y, @w+10, @h+10, @colors[@buttons[0]] if @order[@n] == "red"
      @player << @c if @c == "red"  
    end
    
    def blue_square
      draw_rect @x, 150, @w, @h, @colors[@buttons[1]] if @c != "blue"
      draw_rect @x, 150, @w+10, @h+10, @colors[@buttons[1]] if @order[@n] == "blue"
      @player << @c if @c == "blue"
    end
    
    def green_square
      draw_rect 140, @y, @w, @h, @colors[@buttons[2]] if @c != "green"
      draw_rect 140, @y, @w+10, @h+10, @colors[@buttons[2]] if @order[@n] == "green"
      @player << @c if @c == "green"
    end

    def yellow_square
      draw_rect 140, 150, @w, @h, @colors[@buttons[3]] if @c != "yellow"
      draw_rect 140, 150, @w+10, @h+10, @colors[@buttons[3]] if @order[@n] == "yellow"
      @player << @c if @c == "yellow"
    end
    
    def squares 
      red_square 
      blue_square
      green_square
      yellow_square
    end

  def start_play
    @display.draw("Score: #{@s}", 35, 5, 1, 1, 2, Gosu::Color::BLUE)
    @display.draw("#{@msg}", 140, 5, 1, 1, 2, Gosu::Color::BLUE)  
  end
  
  
  def welcome
    @display.draw("#{@status}", 25, 1, 2, 1, 2, Gosu::Color::RED)
  end
  
  def draw
    squares
    welcome if @t == 0
    start_play if @t == 1
  end
      
  def needs_cursor?
    return true
  end
    
def button_down(id)
  case id
    
  when Gosu::KbSpace
    @t = 1 
    
  when Gosu::MsLeft
    @c = "red" if mouse_x > 20 and mouse_x  < 120 and mouse_y > 20 and mouse_y < 120 
    @c = "green" if mouse_x > 130 and mouse_x < 230 and mouse_y > 20 and mouse_y < 120
    @c = "blue" if mouse_x > 20 and mouse_x < 120 and mouse_y > 130 and mouse_y < 230
    @c = "yellow" if mouse_x > 130 and mouse_x < 230 and mouse_y > 130 and mouse_y < 230      
end
end
      
end #window

  window = GameWindow.new
  window.show