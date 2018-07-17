def bubble_sort(array)
   n = array.length
   begin
     swapped = false
     (n - 1).times do |i|
       # #3
       if array[i] > array[i + 1]
         temp = array[i]
         array[i] = array[i + 1]
         array[i + 1] = temp
         swapped = true
       end
     end
   end until not swapped

   array
 end
  