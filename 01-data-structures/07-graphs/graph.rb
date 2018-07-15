require_relative 'node'

class BaconGraph
  attr_accessor :actor_list
  
  def initialize
    @actor_list = []
  end

  
  def add_actor(actor)
    return if @actor_list.index(actor) != nil

    if actor.name == "Kevin Bacon"
      actor.degree_to_bacon = 0
    end

    @actor_list << actor
    
    add_related_cast(actor)
    @actor_list.sort_by!(&:degree_to_bacon)
  end

  
  def find_kevin_bacon(actor)
    actor_path = []

    set_degree_of_bacon

    if actor.degree_to_bacon > 6 
      puts "Cannot find connection within 6 degrees"
      return
    end

    kevin = @actor_list[0]
    temp = actor

    while temp != kevin
      temp_lowest = temp
      temp.film_actor_hash.each { |film, actors|
        actors.sort_by(&:degree_to_bacon)
        if actors[0].degree_to_bacon < temp.degree_to_bacon
          actor_path << temp.name.to_s + " was in "
          actor_path << "'#{film.upcase}' with "
          actor_path << actors[0].name.to_s
          puts actor_path.join("").to_s
          temp = actors[0]
          actor_path = []
        end
      }
    end
    puts "Degree to Bacon: " + actor.degree_to_bacon.to_s
  end
  
  
  
  def add_related_cast(actor_node)
    films = []
    actor_node.film_actor_hash.each { |film, actors|
      films << film
    }
    @actor_list.each { |actor|
      films.each { |film|
        if actor.film_actor_hash.has_key?(film) && actor != actor_node
          actor.film_actor_hash[film] << actor_node
          actor_node.film_actor_hash[film] << actor
        end
      }
    }
  end

  
  def set_degree_of_bacon
    kevin = @actor_list[0]
    next_cast = []
    visited_actors = [kevin]

    kevin.film_actor_hash.each { |film, actors| 
      actors.each { |actor|
        actor.degree_to_bacon = 1
        unless next_cast.index(actor) != nil
          next_cast << actor
          visited_actors << actor
        end
      }
    }

    while visited_actors.length <= @actor_list.length - 1
      temp = []
      next_cast.each { |actor| 
        actor.film_actor_hash.each { |film, actors|
          temp += actors
          actors.each { |actor_b|
            unless visited_actors.index(actor_b) != nil
              actor_b.degree_to_bacon = actor.degree_to_bacon + 1
              visited_actors << actor_b
            end
          }
        }
      }
      next_cast = temp
    end
  end
  
  
end