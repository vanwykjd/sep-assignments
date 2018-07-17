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
