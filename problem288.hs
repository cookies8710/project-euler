sss 0 = 290797
sss n = mod (b*b) 50515093 where b = sss (n-1)

ttt n p = mod (sss n) p

nnn p q = sum $ [(ttt n p) * (p^n)|n<-[0..q]]