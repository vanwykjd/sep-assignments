# This method takes n arrays as input and combine them in sorted ascending  order
# Space complexity

class PoorHeap
    attr_accessor :items
  def initialize(*arrays)
    @items = arrays.flatten
  end
  
  def heap_sort
    size = @items.size - 1
    heap_array = @items
    parent_index = size / 2
    
    while parent_index > -1 
      build_heap(heap_array, parent_index, size)
      parent_index -= 1
    end 
    
    while size > 0
      heap_array[0], heap_array[size] = heap_array[size], heap_array[0]
      size -= 1
      build_heap(heap_array, 0, size)
    end
    heap_array
  end

  def build_heap(array, parent_index, size)
    parent = array[parent_index]

    while (left_child_index = parent_index * 2) <= size
      right_child_index = left_child_index + 1
      if left_child_index < size && array[left_child_index] < array[right_child_index]
        left_child_index = right_child_index
      end
      if array[left_child_index] <= parent
        break
      end
      array[parent_index] = array[left_child_index]
      parent_index = left_child_index
    end

    array[parent_index] = parent
  end
end

def poorly_written_ruby(*arrays)
  array = PoorHeap.new(*arrays)
  array.heap_sort
end


def test(*arrays)
  arr = arrays.flatten
  test = arr.sort
  poor = poorly_written_ruby(*arrays)
  
  if test == poor
    p "match"
  else
    p "miss"
  end
end

test([34, 20, 27, 49, 18], [44, 17, 43, 5, 24], [29, 16, 47, 47, 30], [50, 47, 23, 12, 35], [10, 31, 27, 42, 6], [31, 38, 42, 46, 36], [41, 9, 9, 43, 10], [26, 25, 46, 48, 37], [27, 30, 50, 20, 18], [50, 25, 1, 25, 36])
