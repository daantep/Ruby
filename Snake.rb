#-------
#MODULES
#-------
require 'ruby2d'
require 'timeout'



#------
#COLORS
#------
$blackcolor = "#231f20"
$snakecolor = "#613DC1"
$linecolor = "#4E148C"
$applecolor = "#858AE3"
$textcolor = "#7466DE"
$specialapplecolor = "#3B3E82"


#---------
#FUNCTIONS
#---------



#------
#SCREEN
#------
@FPS_CAP = 5
WIDTH = 800
HEIGHT = 600
set title: "RubySnake" 
set width: WIDTH
set height: HEIGHT
set background: $blackcolor
@score = 0
set fps_cap: @FPS_CAP

#---------
#CONSTANTS
#---------
$GRID_SIZE = 50
$GRID_WIDTH = Window.width / $GRID_SIZE
$GRID_HEIGHT = Window.height / $GRID_SIZE
$SQUARE_X = 400
$SQUARE_Y = 300











#------------
#GAME OBJECTS
#------------




if @score > 5
  set fps_cap: 6
elsif @score > 10
  set fps_cap: 7
elsif @score > 15
  set fps_cap: 8
elsif @score > 20
  set fps_cap: 9
elsif @score > 25
  set fps_cap: 10
elsif @score > 30
  set fps_cap: 11
elsif @score > 35
  set fps_cap: 12
elsif @score > 40
  set fps_cap: 13
elsif @score > 45
  set fps_cap: 14
elsif @score > 50
  set fps_cap: 15
else 
  set fps_cap: 5
end

class Snake
  attr_writer :direction
    def initialize
        @positions = [[2, 0], [2, 1], [2,2], [2,3]]
        @direction = "down"
        @growing = false
    end
    def draw
        @positions.each do |position|
          @do_type = "move"
            @newsquare = Square.new(
                x: position[0] * $GRID_SIZE,
                y: position[1] * $GRID_SIZE,
                size: $GRID_SIZE - 1,
                color: $snakecolor
            )
          
        end
    end

    def grow
      @growing = true
    end

    def move
      if !@growing
        @positions.shift
      end
      case @direction
      when 'down' 
        @do_type = "turn"
        @positions.push(new_coords(head[0], head[1] + 1))
      when 'up'
        @do_type = 
        @positions.push(new_coords(head[0], head[1] - 1))
      when 'left'
        @do_type = "turn"
        @positions.push(new_coords(head[0] - 1, head[1]))
      when 'right'
        @do_type = "turn"
        @positions.push(new_coords(head[0] + 1, head[1]))
      end
      @growing = false
    end
    def hit_itself?
      @positions.uniq.length != @positions.length
    end
    def new_coords(x, y)
      [x % $GRID_WIDTH, y % $GRID_HEIGHT]
    end


      def head
        @positions.last
      end

      class Game
        def initialize
          @ball_x = 10
          @ball_y = 10
          @score = 0
          @finished = false
        end
      
        def draw
          Square.new(x: @ball_x * $GRID_SIZE, y: @ball_y * $GRID_SIZE, size: $GRID_SIZE, color: $applecolor)
          Text.new(text_message, color: $textcolor, x: 10, y: 10, size: 25, z: 200)
        end
        def specialdraw
          Square.new(x: (@ball_x + rand(1..5)) * $GRID_SIZE, y: (@ball_y + rand(1..5)) * $GRID_SIZE, size: $GRID_SIZE, color: $specialapplecolor)
        end
        def snake_hit_ball?(x, y)
          @ball_x == x && @ball_y == y
        end

        def record_hit
          @score += 1
          @ball_x = rand(Window.width / $GRID_SIZE)
          @ball_y = rand(Window.height / $GRID_SIZE)
        end
        def finish
          @finished = true
          @start = "restart"
        end
      
        def finished?
          @finished
        end
        def text_message
          if finished?
            "Game over, Your Score was #{@score}. Press 'R' to restart. "
          else
            "Score: #{@score}"
          end
        end
      end


    def can_change_direction_to?(new_direction)
      case @direction
      when 'up'
        new_direction != 'down'
      when 'down'
        new_direction != 'up'
      when 'left'
        new_direction != 'right'
      when 'right'
        new_direction != 'left'
      end
    end


    def x
      head[0]
    end

    def y
      head[1]
    end
    snake = Snake.new
    game = Snake::Game.new

end


snake = Snake.new
game = Snake::Game.new


    on :controller_axis do |event|
      case event.axis
      when :left_x
        # Left analog stick x axis
        puts event.value
      when :left_y
        # Left analog stick y axis
        puts event.value
      when :right_x
        # Right analog stick x axis
        puts event.value
      when :right_y
        # Right analog stick y axis
        puts event.value
      end
    end
  
def snakegame
  snake = Snake.new
  game = Snake::Game.new

    update do
    clear

    unless game.finished?
      snake.move
    end

    on :key_down do |event|
      if ['up', 'down', 'left', 'right'].include?(event.key)
        if snake.can_change_direction_to?(event.key)
          snake.direction = event.key
        end
      end
    end
    snake.draw
    game.draw
    if game.snake_hit_ball?(snake.x, snake.y)
      game.record_hit
      snake.grow
    end
  
    if snake.hit_itself?
      game.finish
    end
    
  
  Line.new(
    x1: 50, y1: 0,
    x2: 50, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )  
  Line.new(
    x1: 100, y1: 0,
    x2: 100, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 150, y1: 0,
    x2: 150, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 200, y1: 0,
    x2: 200, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 250, y1: 0,
    x2: 250, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20

  )
  Line.new(
    x1: 300, y1: 0,
    x2: 300, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 350, y1: 0,
    x2: 350, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 400, y1: 0,
    x2: 400, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 450, y1: 0,
    x2: 450, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 500, y1: 0,
    x2: 500, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 550, y1: 0,
    x2: 550, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 600, y1: 0,
    x2: 600, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 650, y1: 0,
    x2: 650, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 700, y1: 0,
    x2: 700, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 750, y1: 0,
    x2: 750, y2: 600,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 50,
    x2: 800, y2: 50,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 100,
    x2: 800, y2: 100,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 150,
    x2: 800, y2: 150,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 200,
    x2: 800, y2: 200,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 250,
    x2: 800, y2: 250,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 300,
    x2: 800, y2: 300,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 350,
    x2: 800, y2: 350,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 400,
    x2: 800, y2: 400,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 450,
    x2: 800, y2: 450,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 500,
    x2: 800, y2: 500,
    width: 1,
    color: $linecolor,
    z: 20
  )
  Line.new(
    x1: 0, y1: 550,
    x2: 800, y2: 550,
    width: 1,
    color: $linecolor,
    z: 20
  )

end
end



 
def Title
  clear
  snake = Snake.new
  game = Snake::Game.new
  if game.finished?
    @start = "restart"
  else
    @start = "get started"
  end
  Text.new(
  "RubySnake",
  x: 150,
  y: 150,
  color: $snakecolor,
  size: 100, 
  z: 3000
  )
  Text.new(
    "Press 'R' to #{@start}.",
    x: 230,
    y: 350,
    color: "#ffffff",
    size: 30,
    z: 3000
    )






    on :key_down do |event|
      snake = Snake.new
      game = Snake::Game.new
      if event.key == "s"
        snakegame
      end


  end
end
on :key_down do |event|
  if event.key == 'r'
    clear 
    snakegame
  end
end




Title()




show