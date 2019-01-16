nofdays = [31,28,31,30,31,30,31,31,30,31,30,31] 
nofdaysLeap = [31,29,31,30,31,30,31,31,30,31,30,31] 

leapYear :: Int -> Bool
leapYear y = mod y 4 == 0

nextDay :: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
nextDay (d,m,y, dow) = if (leapYear y) then nextDayLeap (d,m,y, dow) else nextDayNonLeap (d,m,y, dow)

nextDayLeap:: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
nextDayLeap (d,m,y, dow) = if ((d+1)<(nofdaysLeap !! (m-1))) then (d+1,m,y, mod (dow+1) 7)
                      else if(m < 12) then (1, m+1, y, mod (dow+1) 7)
                      else (1, 1, y+1, mod (dow+1) 7)
nextDayNonLeap:: (Int, Int, Int, Int) -> (Int, Int, Int, Int)
nextDayNonLeap (d,m,y, dow) = if ((d+1)<(nofdays !! (m-1))) then (d+1,m,y, mod (dow+1) 7)
                      else if(m < 12) then (1, m+1, y, mod (dow+1) 7)
                      else (1, 1, y+1, mod (dow+1) 7)

d 0 = (1,1,1901,0)                     
d n = nextDay (d(n-1))

d2 :: Int -> [(Int, Int, Int, Int)] -> [(Int, Int, Int, Int)]
d2 0 l = l
d2 n x = [nextDay(1,1,1900,1)]

result = length(filter (\(a,b,c,w) -> a == 1 && w == 6) (takeWhile (\(a,b,c,w) -> c < 2001) (reverse(d2 40000 [(1,1,1901,0)]))))