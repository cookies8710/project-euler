import Data.Char

factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n-1)

solution = sum $ map digitToInt $ show $ factorial 100