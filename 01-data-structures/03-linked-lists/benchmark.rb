require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

list = LinkedList.new
array = []

Benchmark.bm(7) do |x|
  x.report("Create Array:") { 10000.times { |i| array.push(Node.new(i)) } }
  x.report("Append List: ") { 10000.times { |i| list.add_to_tail(Node.new(i)) } }
  x.report("Access Array:") { array[4999] }
  x.report("Access List: ") { current = list.head; 4999.times { current = current.next } }
  x.report("Remove Array:") { array.delete_at(4999) }
  x.report("Remove List: ") { current = list.head; 4999.times { current = current.next }; list.delete(current) }
end
