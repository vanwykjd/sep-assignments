require_relative 'hash_item'

class HashClass

  def initialize(size)
      @items = Array.new(size)
  end

  def []=(key, value)
      hash = HashItem.new(key, value)
      index_key = index(key, size)

      if @items[index_key].nil?
          @items[index_key] = hash
      elsif @items[index_key].key != hash.key
          resize
          self[key] = value
      elsif @items[index_key].value != hash.value
          resize
          @items[index_key] = value
      end
  end


  def [](key)
      @items[index(key, size)].value
  end

  def resize
      temp = @items
      @items = Array.new(size * 2)
      
      temp.each do |hash|
          hash.nil? ? next : self[hash.key] = hash.value
      end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
      key_ascii_val = key.each_byte.sum
      true_index = key_ascii_val % size
      true_index
  end

  # Simple method to return the number of items in the hash
  def size
      @items.length
  end

end