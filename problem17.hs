oneToNine = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
tenToNineteen = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
twentyToNinety = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

ander n = if (mod n 100 /= 0) then "and" else ""
ntostr 0 = ""
ntostr 1000 = "onethousand"
ntostr n = if (n < 10) then (oneToNine !! (n-1)) else 
           if (n < 20) then (tenToNineteen !! (n-10)) else
           if (n < 100) then (twentyToNinety !! ((div n 10) - 2)) ++ (ntostr (mod n 10))
           else ((ntostr (div n 100))++"hundred" ++ (ander n) ++ (ntostr (mod n 100)))

result2 = sum(map length((map ntostr [1..1000])))
result1 = sum(map length oneToNine)*90 + sum(map length tenToNineteen)*10 + sum(map length twentyToNinety)*10 + 7*899 + sum(map length oneToNine)*100 + 3*899