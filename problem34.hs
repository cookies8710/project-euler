-- jsou jen 2: 145 a 40585

import Data.Char

sumdigitfac n = sum $ map (\a -> product [1..a]) $ map digitToInt $ show n

solution = filter (\n -> n == sumdigitfac n) [3..1000000]