require 'benchmark'
require_relative './heap_tree/node'
require_relative './heap_tree/heap_tree'
require_relative './binary_tree/node'
require_relative './binary_tree/binary_search_tree'

root_tree = Node.new("1", 1)
tree = BinarySearchTree.new(root_tree)
root_heap = Node.new("1", 1)
heap = MinHeap.new(root_heap)

array = []

10000.times { |i| array.push(Node.new("#{i + 1}", i + 1)) }

Benchmark.bm(7) do |x|
  x.report("Insert BinarySearchTree:") { array.each { |node| tree.insert(root_tree, node) } }  
  x.report("Insert HeapMin:") { array.each { |node| heap.insert(root_tree, node) } }
  x.report("Find BinarySearchTree:") { tree.find(root_tree, array[4].title) }
  x.report("Find MinHeap:") { heap.find(root_heap, "5000" ) }
  x.report("Delete BinarySearchTree:") { tree.delete(root_tree, array[4].title) }
  x.report("Delete MinHeap:") { p heap.delete(root_heap, array[4].title ) }
end