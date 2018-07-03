require 'benchmark'
require_relative './heap_tree/heap_node'
require_relative './heap_tree/heap_tree'
require_relative './binary_tree/node'
require_relative './binary_tree/binary_search_tree'

root_tree = Node.new("1", 1)
tree = BinarySearchTree.new(root_tree)
root_heap = HeapNode.new("1", 1)
heap = MinHeap.new(root_heap)

tree_array = []
heap_array = []

9999.times { |i| tree_array.push(Node.new("#{i + 2}", i + 2)) }
9999.times { |i| heap_array.push(HeapNode.new("#{i + 2}", i + 2)) }

Benchmark.bm(7) do |x|
  x.report("Insert BinarySearchTree:") { tree_array.each { |node| tree.insert(root_tree, node) } }  
  x.report("Insert HeapMin:") { heap_array.each { |node| heap.insert(root_tree, node) } }
  x.report("Find BinarySearchTree:") { tree.find(root_tree, "5000") }
  x.report("Find MinHeap:") { heap.find(root_heap, "5000" ) }
  x.report("Delete BinarySearchTree:") { tree.delete(root_tree, "5000") }
  x.report("Delete MinHeap:") { heap.delete(root_heap, "5000") }
end

