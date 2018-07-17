def bucket_sort(array)
  return if array.empty?
  
  bucket_size = 5
  min_val = array.min
  max_val = array.max
  
  bucket_count = ((max_val - min_val) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  
  (0..buckets.length - 1).each { |i|
    buckets[i] = []  
  } 
  
  (0..array.length - 1).each { |bucket|
    buckets[((array[bucket] - min_val) / bucket_size).floor] << array[bucket]
  }
  
  array = []
  
  (0..buckets.length - 1).each{ |bucket|
    bucket = insertion_sort(buckets[bucket])
    bucket.each { |item|
      next if item.nil?
      array << item  
    }
  }
  
  array
end

def insertion_sort(array)
  sorted_array = [array.delete_at(0)]

  until array.length == 0
    insert_value = array.delete_at(0)
    insert_index = 0
    while insert_index < sorted_array.length
      if insert_value <= sorted_array[insert_index]
        sorted_array.insert(insert_index, insert_value)
        break
      elsif insert_index == sorted_array.length - 1
        insert_index += 1
        sorted_array.insert(insert_index, insert_value)
        break
      end
      insert_index += 1
    end
  end
  sorted_array
end
