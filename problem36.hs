-- najit palindromaticke cisla do 1M v desitkove soustave a pak vyfiltrovat 
-- 6 cif: 100..999 -> 900
-- 5 cif: 10*(10..99) -> 900
-- 4 cif: 10..99 -> 90
-- 3 cif: 9 * 10 -> 90
-- 2 cif: 11, 22, .., 99 -> 9
-- 1 cif: 10

import Data.Char

tbh :: Integral a => a -> [a] -> [a] 
tbh 0 l = l 
tbh n l = tbh (div n 2) ((mod n 2):l)

toBinary n =  map intToDigit $ map fromIntegral $ tbh n []

isPalindromeInBinary :: Integer -> Bool
isPalindromeInBinary n = b == reverse b where b = toBinary $ fromIntegral n

rev n = read r :: Integer where r = reverse $ show n
palin10 :: [Integer]
palin10 = [0..9] ++ 
	[11 * n|n<-[1..9]] ++ 
	[a*100 + b*10 + a|a<-[1..9], b<-[0..9]] ++ 
	[a*100 + rev a|a<-[10..99]] ++
	[a*1000 + b * 100 + rev a|a<-[10..99], b<-[0..9]] ++
	[a * 1000 + rev a|a <- [100..999]] 

solution = filter isPalindromeInBinary palin10