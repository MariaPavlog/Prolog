
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).


%men/0
men:- man(X), write(X), nl,fail.

%women/0
women:- woman(X), write(X), nl,fail.

%output of all children X
%children/1
%children(+X)
children(X):-parent(X,Y), write(Y), nl,fail.

%is X the mother of Y
%mother/2
%mother(+X,+Y)
mother(X, Y):- parent(X, Y), woman(X).


%outputs mom X
%mother/1
%mother(+X)
mother(X):- parent(Y, X), woman(Y), write(Y).

%is X the brother of Y
%brother/2
%brother(+X,+Y)
brother(X, Y) :-mother(Z, X),mother(Z, Y), X \== Y, man(X).

%outputs all the brothers X
%brother/1
%brother(+X)
brother(X):-brother(Y, X), write(Y), nl, fail.

%whether X and Y are brother and sister or brothers or sisters
%b_s/2
%b_s(+X, +Y)
b_s(X, Y):- mother(Z, X),mother(Z, Y), X \= Y.

%outputs all X brothers or sisters
%b_s/1
%b_s(+X)
b_s(X):- b_s(X,Y), write(Y), nl, fail.
