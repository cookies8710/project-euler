import Data.List

nDigits2 n = ceiling $ (log $ fromIntegral n / log 10)
nDigits n = length $ show n

fibstep l = l ++ [(last l) + (last $ init l)]
fibgen =  iterate fibstep [1,1]

solution = takeWhile (\x -> snd x <= 1000) $ map (\x -> (length x, nDigits $ last x)) $ fibgen