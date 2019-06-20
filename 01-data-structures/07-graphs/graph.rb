
require_relative 'node'

class BaconGraph
  attr_accessor :actor_list
  
  def initialize
    @actor_list = []
    @film_list = []
  end

  
  def add_actor(actor)
    return if @actor_list.index(actor) != nil

    if actor.name == "Kevin Bacon"
      actor.degree_to_bacon = 0
    end

    @actor_list << actor
    
    add_related_cast(actor)
  end

  
  def find_kevin_bacon(actor)

    set_degree_of_bacon

    kevin = @actor_list[0]
    temp = actor

    while temp != kevin
      temp_lowest = temp
      temp.film_actor_hash.each { |film, actors|
        actors.sort_by(&:degree_to_bacon)
        if actors[0].degree_to_bacon < temp.degree_to_bacon
          @film_list <<  film
          temp = actors[0]
        end
      }
    end
    
    if @film_list.length > 6
      p "#{actor.name} is not within 6 degrees of Bacon"
    else
      p @film_list
    end
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