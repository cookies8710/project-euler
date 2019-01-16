squares = [(a, a*a)|a<-[1..1000]]

sqrti n = if lu == [] then -1 else fst $ head lu where lu = filter (\x -> snd x == n) squares

solfor n = filter (\(a,b,c) -> negate c /= 1 && (a + b + c) == n) $ [(a, b, sqrti (a*a+b*b))|a<-[1..div n 2],b<-[1..div n 2],a<=b]
-- [(a, b, sqrti (a*a+b*b))|a<-[1..120],b<-[1..120],a<b,negate $ sqrti(a*a+b*b)/=1,a+b+sqrti(a*a+b*b)==120]

-- JINAK: spocitat prepony pro vsechna a, b od 0 do 500 (1/2 z 1000, ptze c > a, b && c+a+b <= 1000); 2) vyfiltrovat na ctvercove prepony; 3) roztridit podle souctu a+b+c
-- asi lepsi imperativne