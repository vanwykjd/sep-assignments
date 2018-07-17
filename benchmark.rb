
require 'benchmark'

require_relative 'bucket_sort'
require_relative 'quick_sort'
require_relative 'heap_sort'

require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'


array_qs = []
array_hs = []
array_bs = []

array_is = []
array_ss = []
array_bbs = []
array_ms = []

50.times { |i|
  i = rand(100)
  array_qs << i
  array_hs << i
  array_bs << i
  array_is << i
  array_ss << i
  array_bbs << i
  array_ms << i
}

Benchmark.bm(7) do |x|
  x.report("Quick Sort:      ") { quick_sort(array_qs) }
  x.report("Heap Sort:       ") { heap_sort(array_hs) }
  x.report("Bucket Sort:     ") { bucket_sort(array_bs) }
end

  
Benchmark.bm(7) do |x|
  x.report("Insertion Sort:  ") { insertion_sort(array_is) }
  x.report("Selection Sort:  ") { selection_sort(array_ss) }
  x.report("Bubble Sort:     ") { bubble_sort(array_bbs) }
  x.report("Merge Sort:      ") { merge_sort(array_ms) }
end
