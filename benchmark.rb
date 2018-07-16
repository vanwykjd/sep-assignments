require 'benchmark'
require_relative 'fibonacci_iterative'
require_relative 'fibonnaci_recursive'


Benchmark.bm(7) do |x|
  x.report("Fibonacci iterative: ") { fib_i(20) }
  x.report("Fibonnaci recursive: ") { fib_r(20) }
end