include RSpec

require_relative 'city'
require_relative 'tsp_greed'

RSpec.describe TravelingSalesman, type: Class do
  let (:map) { TravelingSalesman.new }
  
  let (:chicago) { City.new("Chicago") }
  let (:seattle) { City.new("Seattle") }
  let (:los_angeles) { City.new("Los Angeles") }
  let (:ft_lauderdale) { City.new("Ft. Lauderdale") }
  let (:new_york) { City.new("New York") }
  
  before do
    chicago.add_neighbor(seattle, 2064)
    chicago.add_neighbor(los_angeles, 2015)
    chicago.add_neighbor(ft_lauderdale, 1359)
    chicago.add_neighbor(new_york, 796)

    seattle.add_neighbor(los_angeles, 1137)
    seattle.add_neighbor(ft_lauderdale, 3277)
    seattle.add_neighbor(new_york, 2858)

    los_angeles.add_neighbor(ft_lauderdale, 2711)
    los_angeles.add_neighbor(new_york, 2777)

    ft_lauderdale.add_neighbor(new_york, 1259)
    
    map.add_cities(chicago)
    map.add_cities(seattle)
    map.add_cities(los_angeles)
    map.add_cities(new_york)
    map.add_cities(ft_lauderdale)
  end
  
  describe "#find_nearest_possible_neighbor(data)" do
    specify {
      expected_output = "Ft. Lauderdale => New York => Chicago => Los Angeles => Seattle => Ft. Lauderdale"
      expect { map.find_nearest_possible_neighbor(ft_lauderdale) }.to output(expected_output).to_stdout
    }
    
    specify {
      expected_output = "New York => Chicago => Ft. Lauderdale => Los Angeles => Seattle => New York"
      expect { map.find_nearest_possible_neighbor(new_york) }.to output(expected_output).to_stdout
    }
    
    specify {
      expected_output = "Los Angeles => Seattle => Chicago => New York => Ft. Lauderdale => Los Angeles"
      expect { map.find_nearest_possible_neighbor(los_angeles) }.to output(expected_output).to_stdout
    }
    
    specify {
      expected_output = "Seattle => Los Angeles => Chicago => New York => Ft. Lauderdale => Seattle"
      expect { map.find_nearest_possible_neighbor(seattle) }.to output(expected_output).to_stdout
    }
    
    specify {
      expected_output = "Chicago => New York => Ft. Lauderdale => Los Angeles => Seattle => Chicago"
      expect { map.find_nearest_possible_neighbor(chicago) }.to output(expected_output).to_stdout
    }
  end
  
end