pn = map (\x -> div (x * (3*x - 1)) 2) [2..]
hn = map (\x -> x * (2 * x - 1)) [2..]

--ladderclimbing :: [a] -> [a] -> [a]
ladderclimbing xl@(x:xs) yl@(y:ys) = if(x==y) then x:(ladderclimbing xs ys) else
	if (x > y) then ladderclimbing xl ys else ladderclimbing xs yl

solution = take 2 (ladderclimbing pn hn)