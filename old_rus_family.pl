
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

%is X a daughter of Y.
%daughter/2
%daughter(+X, +Y)
daughter(X, Y):- woman(X), parent(Y, X).

%outputs daughter X.
%daughter/1
%daughter(+X)
daughter(X):- woman(Y), parent(X,Y), write(Y), nl,fail.

%is X the wife of Y.
%wife/2
%wife(+X,+Y)
wife(X,Y):- woman(X), man(Y), parent(X,Z), parent(Y,Z).

%outputs wife of X.
%wife/1
%wife(+X)
wife(X):- man(X), woman(Y), wife(Y,X), write(Y).

%is X the grandfather of Y,the fact base
%grand_pa/2
%grand_pa(+X, +Y)
grand_pa(X, Y):- man(X), parent(X, Z), parent(Z, Y).

%predicates only
%add a predicate - is X a child of Y
%child/2
%child(+X, +Y)
child(X,Y):-parent(Y,X).

grand_pa(X, Y):- man(X), child(Z,X), child(Y, Z).

%outputs all grandfathers X.
%the fact base
%grand_pas/1
%grand_pas(+X)
grand_pas(X):- man(Y), parent(Y, Z), parent(Z, X), write(Y), nl, fail.
%predicates only
grand_pas(X):- man(Y), child(Z,Y), child(X, Z), write(Y), nl, fail.

%whether X and Y are grandmother and grandson or grandson and grandmother.
% grand_ma_and_son/2
% grand_ma_and_son(+X,+Y)
% the fact base
grand_ma_and_son(X,Y):- man(X), woman(Y), parent(Y, Z), parent(Z, X).
grand_ma_and_son(X,Y):- man(Y), woman(X), parent(X, Z), parent(Z, Y).

%predicates only
grand_ma_and_son(X,Y):- man(X), woman(Y),child(Z,Y), child(X, Z).
grand_ma_and_son(X,Y):- man(Y), woman(X),child(Z,X), child(Y, Z).

%is X the nephew of Y.
%nephew/2
%nephew(+X, +Y)
%the fact base
nephew(X,Y):- man(X), parent(P, X), parent(G,Y), parent(G,P).
%predicates only
nephew(X,Y):- man(X), child(X,P), b_s(Y,P).

% outputs all the nephews of X.
%nephew/1
%nephew(+X)
%the fact base
nephew(X):- parent(G,X), parent(G,P),man(G), parent(P,Y),man(Y), write(Y), nl,fail.
%predicates only
nephew(X):-b_s(X,P), child(Y,P), man(Y), write(Y), nl, fail.
