-- Problem no. 2 from Euler: 


fibonnaci x = fib x [1,1]

fib :: Integer -> [Integer] -> [Integer]
 

fib 0 l = l
fib n (x:xs) = fib (n-1) ([(x + head xs)] ++ (x:xs))


result = sum(filter (even) (takeWhile (<4000000) (reverse(fibonnaci 100))))