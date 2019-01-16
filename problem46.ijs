NB. base =: ({~ (I.@:(2&|))) (I. (1&-) (e. p:) i.10000)

seed=:3000

NB. primes and squares
p =: p: i. seed
s =: 2 * *: 1 + i. seed

NB. matrix calc

sm =: (seed,seed) $ s
pm =: |: (seed,seed) $ p
sum =: pm + sm

NB. laminating and sorting
nums =:({~ /:) ~. ({~ /:) 1, (2*i.(seed*seed%2)) , (p:i.seed), ,sum

NB. finding gap
firstgap =: {. I. 1 - (i.(seed*seed)) e. nums 

NB. result is 5777