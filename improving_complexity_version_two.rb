# This method takes n arrays as input and combine them in sorted ascending  order
# Time complexity performance

def poorly_written_ruby(*arrays)
  if arrays[0].is_a?(Array)
    combined_array = arrays[0]
    (1..arrays.length - 1).each do |array|
      combined_array += arrays[array]
    end
  else 
    combined_array = arrays[0]
  end
  
  if combined_array.length <= 1
    return combined_array
  else 
     mid = (combined_array.length / 2).floor
     left = poorly_written_ruby(combined_array[0..mid - 1])
     right = poorly_written_ruby(combined_array[mid..combined_array.length])

     combined_array = merge(left, right)
  end
  
  combined_array
end


def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
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
