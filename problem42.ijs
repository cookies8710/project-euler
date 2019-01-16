Exec =: 0 !: 1 										NB. foreign sloveso provadejici retezec

LoadFile =: 1!:1 									NB. foreign sloveso nacitajici obsah souboru

Fst=:{.												NB. head -> prvni prvek seznamu

Snd=:{.@:}.											NB. head after tail -> druhy prvek seznamu

Substring =:dyad define								NB. vraci podretezec - levy argument je seznam indexu, pouziji se jen prvni dva (poc. a koncovy index podretezce) 
b=.Snd x											NB. 	pravy argument je retezec, ze ktereho se vybiraji podretezce
indices=.(+i.&(b&-)) Fst x							NB. hook: ziskam indexy znaku: pokud A je poc. index a B je koncovy index, indices = A A+1 A+2 ... B 
r=. indices { y										NB. vysledek je prosta selekce z retezce podle indexu
)

NB. BoxedSubstring=:< @: Substring 					NB. jednoduse zaboxuju vysledek Substringu

BoxedSubstrings=:dyad define 						NB. rekurzivne vytvori zaboxovane podretezce -> x jsou indexy zacatku a koncu podretezcu, y je retezec
if.(2&<:@:#)x do. 									NB. hook: pokud mam vlevo aspon 2 indexy
r=.x (Substring;(BoxedSubstrings~2&}.)~) y			NB. fork: vysledek je prvni podretezec + rekurzivne dalsi podretezce
else.
r=.<i.0												NB. kdyz nemam 2 indexy, vysledek je prazdny box
end.
)

CharToInt =: a.&i.									NB. vraci ASCII hodnotu znaku

Trinums =: 2%~((* (>:))(>:i.30))					NB. prvnich 30 trojuhelnikovych cisel
Trinums2 =: +/\(>:i.30)								NB. alternativni definice

IsTriNum =: (+/\(>:i.30)) e.~ ]						NB. 1, pokud je trojuhelnikove cislo, jinak 0

main =: 0 : 0
	p42data =. LoadFile <'p042_words.txt' 			NB. nacti slova
	p42data =. (#~ ('"'&i.)) p42data				NB. drop "
	
	substrs =. 0, ({~/:) @: (,>:) (',' (I.@:(1&-)@:i.) p42data)

	extractedWords =. substrs BoxedSubstrings p42data
	calcwordval =. (+/ @: (0&>.) @: (64-~ CharToInt))
	wordvals =. calcwordval |: >extractedWords
	
	solution =. +/ IsTriNum wordvals				NB. 162
)

NB. mohl jsem pouzit ;:
NB. nepouzito: trinumwords =. (I. @: IsTriNum) wordvals 