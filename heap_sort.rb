def heap_sort(array)
  size = array.size - 1
  heap_array = array
  parent_index = size / 2
  
  while parent_index > -1 
    build_heap(heap_array, parent_index, size)
    parent_index -= 1
  end 
  
  while size > 0
    swap(heap_array, 0, size)
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

def swap(array, source, target)
  temp = array[source]
  array[source] = array[target]
  array[target] = temp
  
  array
end
