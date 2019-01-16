Exec =: 0 !: 1 										NB. foreign sloveso provadejici retezec

gsd =:monad define
	r=.(p:y),(y+1+i.3)
)


filter =:dyad define 
	r=.({~ I. @: (=&0) @: (({.gsd x)&|) @: (10&#.@|:) @: ((}.gsd x)&{ @: |:)) y
)


main =: 0 : 0
	allperms =. (A.~ (i.&!@#)) (i.10)							NB. vsechny permutace cisel

	filtered =. allperms

	ind =. I. (=&0) (2&|) 3 { |: filtered						NB. indexy cisel, jejichz 4. cifra je suda (->d_2,3,4 je delitelne 2)
	filtered =. ind { filtered

	ind =. I. (=&0) (3&|) +/ 2 3 4 { |: filtered 				NB. indexy cisel, jejichz soucet 3., 4., 5. cifry je delitelny 3
	filtered =. ind { filtered		

	ind =. I. (=&0 +. =&5) 5 { |: filtered 						NB. indexy cisel, jejichz soucet 6. cifra je 0 nebo 5
	filtered =. ind { filtered			

	ind =. I. (=&0) (7&|) (10&#.@|:) 4 5 6 { |: filtered 		NB. indexy cisel, jejichz 5.,6.,7. cifry tvori cislo delitelne 7
	filtered =. ind { filtered			

	ind =. I. (=&0) (11&|) (10&#.@|:) 5 6 7 { |: filtered 		NB. podobne jako u 7
	filtered =. ind { filtered		

	ind =. I. (=&0) (13&|) (10&#.@|:) 6 7 8 { |: filtered 		NB. podobne jako u 7
	filtered =. ind { filtered		

	ind =. I. (=&0) (17&|) (10&#.@|:) 7 8 9 { |: filtered 		NB. podobne jako u 7
	filtered =. ind { filtered		

	]solution =. +/ 10&#. filtered								NB. spocitam vysledek

	]solution2 =. +/ 10&#. (6 filter (5 filter ( 4 filter ( 3 filter ( 2 filter (1 filter (0 filter allperms)))))))
)
