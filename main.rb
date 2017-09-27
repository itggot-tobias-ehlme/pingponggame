require 'gosu' #require is for gems.
require_relative 'ball.rb' #require_relative is for files.
require_relative 'paddle.rb'
class PingPong < Gosu::Window


    def initialize()
        super(640,480)
        setup
        
    end

    def setup
        @player_1 = Paddle.new('left')
        @player_2 = Paddle.new('right')
        
        @ball = Ball.new('img/ball.bmp', @player_1)
      
        
    end
    
    def update
        #sleep(0.1)
        collide
        @ball.update
        # p @player_1.xy
        # p @player_2.xy
        # p @balls[0].xy
        if button_down?(Gosu::KbZ)
            @player_1.move_down
        elsif button_down?(Gosu::KbA)
            @player_1.move_up
        end
        
        if button_down?(Gosu::KbDown)
            @player_2.move_down
        elsif button_down?(Gosu::KbUp)
            @player_2.move_up
        end
        

        p "player Y: " + (@player_2.y).to_s
        p "Ball Y:" + (@ball.y).to_s #+ 30
    end
#@player_2.width @player_2.height
    def collide
        if @ball.x+36 >= @player_2.x && 
                @ball.x+36 >= @player_2.x &&
                    @ball.y <= @player_2.y &&
                        @ball.y >= @player_2.y+50
           @ball.bounce_x
           @ball.bounce_y
            p "yes"
            

        elsif @ball.x <= @player_1.x && 
            @ball.x <= @player_1.x + @player_1.width &&
            @ball.y >= @player_1.y &&
            @ball.y <= @player_1.y + @player_1.height
            @ball.bounce_x
            @ball.bounce_y
            p "neat"
        end
    end
    
    
    def draw
        @ball.draw
        @player_1.draw
        @player_2.draw
        
    end
    def button_down(id)
        if id == Gosu::KB_ESCAPE
            close
        else
            super
        end
  end
end

c = PingPong.new
c.show
