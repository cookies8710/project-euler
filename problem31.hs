solutionBruteForce =  [(p1, p2, p5, p10, p20, p50, l1, l2)|p1<-[0..200],p2<-[0..100],p5<-[0..40],p10<-[0..20],p20<-[0..10],p50<-[0..4], l1<-[0..2],l2<-[0..1],p1+2*p2+5*p5+10*p10+20*p20+50*p50+100*l1+200*l2==200]
solution1Pound =  [(p1, p2, p5, p10, p20, p50)|p1<-[0..100],p2<-[0..50],p5<-[0..20],p10<-[0..10],p20<-[0..5],p50<-[0..2], p1+2*p2+5*p5+10*p10+20*p20+50*p50==100]

solution10Pence =  [(p1, p2, p5, p10)|p1<-[0..10],p2<-[0..5],p5<-[0..2],p10<-[0..1], p1+2*p2+5*p5+10*p10==10]
solution20Pence =  [(p1, p2, p5, p10, p20)|p1<-[0..20],p2<-[0..10],p5<-[0..4],p10<-[0..2],p20<-[0..1], p1+2*p2+5*p5+10*p10+20*p20==20]

-- runningSum list n -> list je seznam hodnot minci (sestupny), n je celkova suma, kterou je treba poskladat
-- jak to funguje: postupne se snazim rekurzivne ukrajovat ze zbyvajici castky 
runningSum [k] n = if (mod n k == 0) then 1 else 0
runningSum (x:xs) n = sum $ map (\a -> runningSum xs (n-a*x)) [0..k] where k = div n x 

solution = runningSum [200, 100, 50, 20, 10, 5, 2, 1] 200