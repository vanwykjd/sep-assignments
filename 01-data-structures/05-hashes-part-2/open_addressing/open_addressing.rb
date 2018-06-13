require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    hash = Node.new(key, value)
    hash_code = index(hash.key, size)
    if @items[hash_code] != nil
      hash_code = next_open_index(hash_code)
      if hash_code < 0
        resize 
        @items[hash_code] = hash
      end 
    end
    @items[hash_code] = hash
  end

  def [](key)
    hash_code = index(key, size)
    hash = @items[hash_code]
    while hash.key != key && hash != nil
      hash_code += 1
      hash = @items[hash_code % size]
    end
    hash.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii_val = key.each_byte.sum
    true_index = ascii_val % size
    true_index
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    i = index
    while @items[i % size] != nil && i < (index + size)
      i += 1
    end
    if i < (index + size)
      i % size
    else 
      index - i
    end
  end 

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(size * 2)
    temp.each do |hash|
      hash == nil ? next : @items[index(hash.key, size)] = hash
    end
  end
  
end