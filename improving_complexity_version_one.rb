# This method takes n arrays as input and combine them in sorted ascending  
# Code optimizations

def poorly_written_ruby(*arrays)
  combined_array = arrays[0]
  
  (1..arrays.length - 1).each do |array|
    combined_array += arrays[array]
  end

  sorted_array = [combined_array.delete_at(-1)]  
  
  (0..combined_array.length - 1).each do |j|
    i = 0
    if combined_array[j] >= sorted_array[-1]
      sorted_array << combined_array[j]
    else
      while i < sorted_array.length
        if combined_array[j] <= sorted_array[i]
          sorted_array.insert(i, combined_array[j])
          break
        elsif i == sorted_array.length - 1
          sorted_array << combined_array[j]
          break
        end
        i+=1
      end
    end
  end

  sorted_array
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


