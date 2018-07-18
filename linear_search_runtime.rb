def linear_search_runtime(n)
    (1..n).each { |i|
      puts "  n = #{i}  |  Big-O = #{i}"      
    }
end

linear_search_runtime(10)
