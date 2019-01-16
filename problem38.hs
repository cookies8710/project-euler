-- problem 38

c1 [] n = 0
c1 (x:xs) n = if (x == n) then (1+c1 xs n) else (c1 xs n)

haszero [] = False
haszero (x:xs) = if (x == '0') then True else (haszero xs)

p1 n = (map (\c -> c1 (show n) c) ['1'..'9'])
p2 n = null(filter (>1) (p1 n)) && (not (haszero (show n)))

pandigit n = null(filter (/= 1) (p1 n)) && (not (haszero (show n)))

-- nuda: 932718654