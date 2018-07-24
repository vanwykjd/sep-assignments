require_relative 'city'

class TravelingSalesman
  attr_accessor :cities

  def initialize
    @cities = Array.new()
  end

  def find_nearest_possible_neighbor(start_city)
    list_of_cities = @cities
    list_of_cities.delete(start_city)

    current_city = start_city
    
    print "#{start_city.name} => "
    until list_of_cities.length == 1
      next_city = list_of_cities[0]
      list_of_cities.each { |city|
        next if city.name == current_city.name
        if current_city.distance[city] < current_city.distance[next_city] 
            next_city = city
        end
      }
      current_city = next_city
      print "#{current_city.name} => "
      list_of_cities.delete(next_city)
    end
    print "#{list_of_cities[0].name} => #{start_city.name}"
  end

  def add_cities(city)
    @cities << city
  end

end
