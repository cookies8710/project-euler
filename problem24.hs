fact 0 = 1
fact n = n * fact(n-1)

fh f n = div n (fact f)
fh2 1 n = [n]
fh2 f n = (fh f n): (fh2 (f-1) (n-(fh f n)*fact(f))) 

ffact9 n = fh2 9 n

--m1 :: (Integer -> Integer -> Integer) -> [Integer] -> [Integer] -> [Integer]
--m1 f [] _ = []
--m1 f _ [] = []
--m1 f (x:xs) (y:ys) = (f x y):(m1 f xs ys)

-- removes first occurence of n in list
dellist :: Integer -> [Integer] -> [Integer]
dellist _ [] = []
dellist n (x:xs) = if (x==n) then xs else x:(dellist n xs)

-- black magic
b [] l = l
b _ [] = []
b (x:xs) l = (l !! x) : (b xs (dellist (l !! x) l))

generateResultNumber n =  b (ffact9 (n-1)) [0..9]

--result = 2783915460

