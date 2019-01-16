import Data.Char

sumOfDigitsToFifth n = sum $ map (^5) $ map digitToInt $ show n
solution = sum $ map fst $ filter (\x -> fst x == snd x) $ map (\x -> (x, sumOfDigitsToFifth x)) $ [2..999999]