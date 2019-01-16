anyd _ [] = False
anyd n (x:xs) = if (mod n x == 0) then False else anyd n xs
pg (x:xs) i m = if (x > m) then (x:xs) else (if(not (anyd (x+i) (x:xs))) then pg ((x+1):x:xs) 1 m else pg (x:xs) (i+1) m) 