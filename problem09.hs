-- Problem 9: 
--A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
--a**2 + b**2 = c**2

--For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.

--There exists exactly one Pythagorean triplet for which a + b + c = 1000.
--Find the product abc.

isPythagoreanTriplet :: (Integer, Integer, Integer) -> Bool
isPythagoreanTriplet (a, b, c) = (a*a + b*b) == c*c

gpts l = filter isPythagoreanTriplet [(a,b,c)|a<-[1..l], b<-[1..l], c<-[1..l],a<b && b<c]

gen2 ds = [(a,b,c)|a<-[1..ds], b<-[1..ds], c<-[1..ds],a<b && b<c, (a+ b+c) == ds, (a*a+b*b) == c*c]
gen3 = [(a,b)|a<-[1..1000], b<-[1..1000], a<b && (1000-a-b)>b]
gen3a = map (\(a,b) -> (a,b,1000-a-b)) (filter (\(a,b) -> a*a + b*b == (1000-a-b)*(1000-a-b)) gen3)