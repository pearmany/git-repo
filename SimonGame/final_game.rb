class Game
  def initialize
    @buttons = ["red", "blue", "green", "yellow"]
    @n = 0
    start
  end
  
  def start
    @order = @buttons.sample(@n += 1)
    play
  end

  def play
    @order.each do |i|
    system('clear')
    puts i
    sleep 1 
  end
  player_input
end

  def player_input
    system('clear')
    puts "Simon Said?"
    @player = gets.split
    end_game
  end

  def next_level
    @player = []
    system('clear')
    puts "Good Job!"
    sleep 1
    system('clear')
    puts "Get Ready!"
    sleep 3
    start
  end

  def game_over
    system('clear')
    puts "Sorry, Try Again!"
    sleep 2
    system('clear')
    Game.new
  end

  def end_game
    if @order == @player
      next_level
    else
      game_over  
  end
end
end

Game.new