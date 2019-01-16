-- lame, staci vynasobit 5*7*16*9*11*13*17*19

findFirst :: (Integer -> Bool) -> [Integer] -> Integer
findFirst _ [] = 0
findFirst f (x:xs) = if(f x) then x else findFirst f xs