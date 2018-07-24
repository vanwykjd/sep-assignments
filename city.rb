class City
  attr_accessor :neighbors
  attr_accessor :distance
  attr_accessor :name

  def initialize(name)
    @name = name
    @neighbors = Array.new()
    @distance = Hash.new
  end

  def add_neighbor(city, distance)
    if @distance[city] == nil
      @distance[city] = distance
      city.distance[self] = distance
      city.neighbors << self
      @neighbors << city
    else 
      return
    end
  end

end
