--pow2::Integer->Integer->Integer
pow2 x 0 = 0
pow2 x n = x*pow2 x (n-1)

-- me to fungovalo, z nejakeho picneho duvodu to nemuzu rozjet ve skriptu:
--result = 1 + sum $ takeWhile (<1002002) [pow2(2*x-1) + 2*x*c|x<-[1..],c<-[1..4]]

-- vysledek mi vysel 669171001