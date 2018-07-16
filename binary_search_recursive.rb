def binary_search_recursive(array, value)
  min = 0
  max = array.length - 1
  mid = (min + max) / 2
  
  return "#{array[mid]} found" if array[mid] == value
  
  if array[mid] > value
    return binary_search_recursive(array[min..(mid - 1)], value)
  else
    return binary_search_recursive(array[(mid + 1)..max], value)
  end
  return "#{value} not found"
end