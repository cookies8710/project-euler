Exec =: 0 !: 1 										NB. foreign sloveso provadejici retezec

pn =: (-:@* (_1 + 3&*))
hn =: (* (_1 + 2&*))

pns =: pn i.100
pnl =: 100

hni =: 0

fst =: 0
snd =: 0

main =: 0 : 0
	while. snd=0 do.
		snd =: >: snd
	end.
)