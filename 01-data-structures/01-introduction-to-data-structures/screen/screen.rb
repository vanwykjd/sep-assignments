require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    inbounds(width, height)
    
    self.matrix = []
    self.width = width
    self.height = height
    
    height.times do
      self.matrix.push(Array.new(width))
    end
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    self.matrix[x-1][y-1] = pixel
  end

  def at(x, y)
    self.matrix[x-1][y-1]
  end

  private

  def inbounds(x, y)
    x < 0 ? x = nil : x
    y < 0 ? y = nil : y
    
    return x, y
  end

end