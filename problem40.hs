pow x 0 = 1
pow x n = x * pow x (n-1)

-- spocita, kolik celkem cifer maji 'd' ciferna cisla
nciphers d = d * 9 * (pow 10 (d-1))

-- rekne, soucasti kolikaticiferneho cisla je cifra na 'n'-te pozici
kc n = kc' n 1
kc'::Integer->Integer->Integer
kc' n i = if (n < nciphers i) then i else (kc' (n-nciphers i) (i+1))

-- na jake pozici v ramci x-cifernych cisel je 'n'-ta cifra
pozice n = n - sum [nciphers i|i<-[1..((kc n)-1)]]

-- pro 'n'-tou cifru vrati dvojici (x, y), kde x je cislo, jehoz je cifra soucasi, a y je "offset" v cisle
cislo n =  ((div (pozice n) (kc n)) + pow 10 ((kc n)-1),mod (pozice n) (kc n))
cifra (i, p) = cifra' (show i, p) -- jednoduseji: (show i)!!p
cifra' ((x:_), 0) = x
cifra' ((_:xs), i) = cifra' (xs, i-1)

-- vrati retezec cifer, ktere staci pak pronasobit
resultingCiphers = [cifra $ cislo $ ((pow 10 n)-1)|n<-[0..6]]