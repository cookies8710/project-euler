--

cbih::(Int, Int) -> Bool
cbih (a, b) = ((div a 10) == (mod b 10)) && ((fromIntegral(mod a 10)/fromIntegral(div b 10))==(fromIntegral(a)/fromIntegral(b)))

cbi::(Int,Int)-> Bool
cbi (a, b) = (cbih(a,b)) || (cbih(b,a))

result = [(a,b)|a<-[11..99], b<-[11..99],a<b,cbi(a,b)]