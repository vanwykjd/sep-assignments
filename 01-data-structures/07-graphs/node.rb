class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :degree_to_bacon

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new
    @degree_to_bacon = 7
  end

  def add_film(film)
    if @film_actor_hash[film] == nil
      @film_actor_hash[film] = Array.new()
    else
      return 
    end
  end
end