--

prime :: Integer -> Bool
prime n = null(filter (\x -> mod n x == 0) [2..(n-1)])