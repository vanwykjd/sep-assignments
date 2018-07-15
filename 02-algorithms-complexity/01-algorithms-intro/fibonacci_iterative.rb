 def fib(n)
   fib_seq = [0, 1]
   i = 0
   j = 1
   while i <= n-1
     fib = fib_seq[i] + fib_seq[j]
     fib_seq << fib
     i += 1
     j += 1
   end
   return fib_seq[i]
 end

 puts fib(0)
 puts fib(1)
 puts fib(2)
 puts fib(3)
 puts fib(4)
 puts fib(5)
 puts fib(6)
 puts fib(7)
 puts fib(8)
 puts fib(9)