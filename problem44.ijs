pn =: (-:@* (_1 + 3&*))

k=.2500										NB. testuju prostor prvnich k pentagonalnich cisel
l=.k+k

ispn =: (pn (1+i.l)) e.~ ]					NB. vraci 1, pokud je pentagonalni cislo; jinak 0

a =: (k,k)$pn (1+i.k)						NB. matice pentagonalnich cisel po sloupcich
b =: |: a									NB. -------------||--------------- radcich
s =: ispn a + b								NB. sectu matice a aplikuju ispn
d =: ispn a - b								NB. odectu ---------||------------
i =: s *. d 								NB. AND na ispn matice souctu a rozdilu -> kde je v matici i 1, tam je rozdil i soucet cisel pentagonalni

si =: {. I. ,i 								NB. "zlinearnim" matici a vezmu index prvni jednicky
si2 =: (<. si % k);(k | si)					NB. vypoctu indexy odpovidajicich pent. cisel

solution =: 7j0":|((pn >: 0{ >si2)-(pn >: 1{ >si2)) NB. vypoctu vysledek a vypisu

NB. nepouzito:
NB. ispn =: ((= >.) & ((<1 0) { > p. (_2*])) _1 3
NB. m =: (>. @: (%&3)@: <:)					NB. horni limit indexu pentagonalniho cisla pro skok delky y