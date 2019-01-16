genlist kk xx = [(k,a,b,c)| k <- [1..kk], a <- [-xx..xx],b <- [-xx..xx],c <- [-xx..xx], a < b && b < c]

angles (k,a,b,c) = [trilen (k,a,b), trilen(k,a,c), trilen(k,b,c)]


hca (a,b,c) = (a*a + b*b - c*c) / (2*a*b)
calcangle [a,b,c] = [hca (a,b,c), hca(a,c,b), hca(b,c,a)]

valid [] = False
valid (x:xs) = if (abs(x-(sqrt(0.5))) < 0.01) then True else valid xs



-- calculates the length of line segment [s, s*s/k], [t, t*t/k]
help (k,s,t) = [t-s, (s*s - t*t)/k]
sl [a, b] = sqrt (a*a+b*b)
trilen (k,s,t) = sl (help (k,s,t))

getresult kk xx = length(filter valid (map calcangle (map angles (genlist kk xx))))

v2 (k, a, b, c) = valid(calcangle(angles(k,a,b,c)))