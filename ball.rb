class Ball

    attr_reader :x, :y

    def initialize(image_path, player)
        @player = player
        @image = Gosu::Image.new(image_path)
        @vel_x = set_initial_speed
        @vel_y = set_initial_speed
        @x = (640 / 2) - @image.width / 2
        @y = (480 / 2) - @image.height / 2
       # @xy = xy
    end

    def set_initial_speed
        speed = 3# rand(-3..3)
        if speed == 0
            set_initial_speed
        else
            return speed
        end
        
    end

    def bounce_x
         @vel_x *= -1
    end

    def bounce_y
         @vel_y *= -1
    end

    

    def update
        @x += @vel_x
        @y += @vel_y
        
        if @x <= 0
            @x = 0
            @vel_x *= -1
        elsif @y <= 0
            @y = 0
            @vel_y *= -1
        elsif @x >= 640 #- @image.width
           # @x = 640 - @image.width
            @vel_x *= -1
            
        elsif @y >=480 #- @image.height
           # @y = 480 - @image.height
            @vel_y *= -1
           

        end
        
            
    end



    def draw
        @image.draw(@x, @y, 0)
    end
    
    

end
