-- Problem no. 1 from Euler: sum of all multiples of 3 or 5 up to 1000

sum3And5 l = 
	sum (takeWhile (<l) [3,6..]) + 
	sum (takeWhile (<l) [5,10..]) - 
	sum (takeWhile (<l) [15, 30..])

