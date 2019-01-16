-- Problem no. 4

--gho n = truncate(log n / log 10)
--ghod n = truncate(n/(10^(gho n)))

isStrPal :: String -> Bool
isStrPal s = s == (reverse s)

isPalindrome :: Integer -> Bool
isPalindrome n = isStrPal(show n)

result = maximum(filter isPalindrome [x*y| x <- [100..999], y <- [100..999]])