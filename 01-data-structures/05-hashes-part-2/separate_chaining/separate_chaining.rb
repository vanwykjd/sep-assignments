require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    hash = Node.new(key, value)
    hash_code = index(hash.key, size)
    if @items[hash_code] != nil
      @items[hash_code].add_to_tail(hash)
    else
      @items[hash_code] = LinkedList.new
      @items[hash_code].add_to_tail(hash)
    end
    if load_factor > @max_load_factor
      resize
    end
  end

  def [](key)
    hash_code = index(key, size)
    temp = @items[hash_code].head
    while temp.key != key
      temp = temp.next
    end
    temp.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    ascii_val = key.each_byte.sum
    true_index = ascii_val % size
    true_index
  end

  # Calculate the current load factor
  def load_factor
    count = 0.0
    @items.each do |bucket|
      if bucket != nil
        temp = bucket.head
          while temp.next != nil
            temp = temp.next
            count += 1
          end
        count += 1
      else
        next
      end
    end
    count/size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    orig_arr = @items
    @items = Array.new(size * 2)
    orig_arr.each do |bucket|
      if bucket != nil 
          temp = bucket.head
          while temp.next != nil
            temp = temp.next
            self[temp.key] = temp.value
          end
          self[temp.key] = temp.value
      else 
        next 
      end
    end
    @items
  end
  
  def status
    key = 0
    items = []
    count = 0.0
    ##Table of #ofItems/Keys/Values
      puts "—".rjust(74, '—') 
      printf(" %s  | [%s] | %s\n", "# ITEMS" , "KEY", "VALUES")
      puts "—".rjust(74, '—') 
      @items.each do |bucket|
        if bucket != nil
          temp = bucket.head
            while temp.next != nil
              items.push(temp.value)
              temp = temp.next
            end
            items.push(temp.value)
            if key < 10
              printf(" %8d |  [%1d]  | %1s\n", items.length, index(temp.key, size),"[#{items.join("], [")}]") 
            else
              printf(" %8d |  [%1d] | %1s\n", items.length, index(temp.key, size),"[#{items.join("], [")}]")
            end
            count += items.length
            key += 1
            items = []
        else
          if key < 10
            printf(" %8d |  [%1d]  | %1s\n", items.length, key,"-empty-")
          else
            printf(" %8d |  [%1d] | %1s\n", items.length, key,"-empty-")
          end
          items = []
          key += 1
        end
      end
    ##Table of Totals
      puts "—".rjust(74, '—') 
      printf(" %s: %d | %s: %d | %s: %0.3f | %s: %0.3f", "TOTAL ITEMS" , count , "# of BUCKETS", key, "CURRENT LF", count / key, "MAX LF", @max_load_factor )
      puts "—".rjust(74, '—') 
  end
    
end
