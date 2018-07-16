def fib_i(n)
  fib_0 = 0
  fib_1 = 1
  
  return fib_0 if n == 0
  return fib_1 if n == 1
 
  1.upto(n-1) { |i|
    i = fib_0
    fib_0 = fib_1
    fib_1 = fib_0 + i 
  }
  return fib_1
end
