-- Problem no. 3

prime :: Integer -> Bool
prime n = null(filter (\x -> mod n x == 0) [2..(n-1)])

findfactor :: Integer -> Integer
findfactor n = head(filter (\x -> mod n x == 0) (filter (prime) [2..n]))

factorize :: Integer -> [Integer]
factorize x = if(prime x) then [x] else [findfactor x] ++ factorize (div x (findfactor x))