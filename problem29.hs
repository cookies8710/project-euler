import Data.List

pow x 0 = 1
pow x n = x*pow x (n-1)

result = length $ nub [pow a b| a <- [2..100], b <-[2..100]] 