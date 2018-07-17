def quick_sort(array)
  return array if array.length <= 1
  
  left = []
  right = []

  pivot_point = array.delete_at(rand(array.size))
  
  array.each { |i|
    if i < pivot_point
      left << i
    else
      right << i
    end
  }
  
  quick_sort(left) + [pivot_point] + quick_sort(right)
  
end
