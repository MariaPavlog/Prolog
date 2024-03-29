in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

zavod() :-
	Friends = [_, _, _],
/* three workers and three professions */
in_list(Friends, [semenov, Prof1]),
in_list(Friends, [borisov, Prof2]),
in_list(Friends, [ivanov, Prof3]),
in_list(Friends, [Human1, tokar]),
in_list(Friends, [Human2, slesar]),
in_list(Friends, [Human3, svarshik]),
/* borisov has sister but slesar doesn't have sister, so borisov is not slesar */
Prof2\=slesar,
/* semenov is older than tokar so semenov can't to be a tokar */
Prof1\=tokar,
/* semenov is older than tokar but slesar is youngest */
Prof1\=slesar,
!,
nl,
write("Slesar surname is - "), write(Human2), nl,
write("Tokar surname is - "), write(Human1), nl,
write("Svarka surname is - "), write(Human3), nl,
nl,
write(Friends).
