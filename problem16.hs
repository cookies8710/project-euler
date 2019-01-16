import Data.Char

pow2 :: Integer -> Integer
pow2 0 = 1
pow2 n = 2 * (pow2 (n-1))

result = sum(map (digitToInt) (show(pow2 1000)))