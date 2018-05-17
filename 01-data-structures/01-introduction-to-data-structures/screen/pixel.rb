# Pixels require three color values: red, green, and blue.
# Pixel colors red, green, and blue values must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
# Pixels also require a coordinate location: x and y.
class Pixel

  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue
  attr_accessor :x
  attr_accessor :y
  
  def initialize(red, green, blue, x, y)
    @pixel = []
    
    color = [red, green, blue, x, y]
    validate_color(color)
    
    self.red = @pixel[0]
    self.green = @pixel[1]
    self.blue = @pixel[2]
    self.x = @pixel[3]
    self.y = @pixel[4]
  end

  private

  def validate_color(color)
    i = 0
    while i < 5 
      if i < 3
        if color[i] < 0 
          color[i] = 0 
          @pixel.push(color[i])
          i += 1
        elsif color[i] > 255
          color[i] = 255
          @pixel.push(color[i])
          i += 1
        end
      end
      @pixel.push(color[i])
      i += 1
    end
    @pixel
  end
end