def binary_search_iterative(array, value)
  min = 0
  max = array.length - 1
  
  while min <= max
    mid = (min + max) / 2
    if array[mid] > value
      max = mid - 1
    elsif array[mid] < value
      min = mid + 1
    else
     return "#{value} found at index #{mid}"
    end
  end
  return "#{value} not found"
end

