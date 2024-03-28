%max of 3 numbers
%max/4
%max(+X,+Y,+U,-Z)
max3(X,Y,U,X):-X>Y,X>U,!.
max3(_,Y,U,Y):-Y>U,!.
max3(_,_,U,U).

%factorial of a number using upward recursion
%fact_up/2
%fact_up(?N,?X)
fact_up(0,1):-!.
fact_up(N,X):-N1 is N-1,fact_up(N1,X1),X is N*X1.

%factorial of a number using downward recursion
%fact_down/2
%fact_down(?N,?X)
fact_down(N,X):-fact2(0,1,N,X).
fact2(N,Y,N,Y):-!.
fact2(N,_,N,_):-!,fail.
fact2(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,Y1,N,X).


%the sum of the digits of the number, recursion upwards
%sum_cifr_up/2
%sum_cifr_up(+X,?C)
sum_cifr_up(0,0):-!.
sum_cifr_up(X,SummCifr):-X1 is X // 10, Ost is X mod 10,
	sum_cifr_up(X1, SummCifr1), SummCifr is SummCifr1 + Ost.

%the sum of the digits of the number, recursion downwards
%sum_cifr_down/2
%sum_cifr_down(+X,?C)
sum_cifr_down(N,X):- sum_cifr_down(N,0,X).
sum_cifr_down(0,X,X):-!.
sum_cifr_down(N,CurX,X):-N1 is N // 10, Ost is N mod 10,
	NewX is CurX + Ost, sum_cifr_down(N1, NewX, X).

%a number free of squares
%free_of_sq/1
%free_of_sq(+X)
free_of_sq(1).
free_of_sq(N):- free_of_sq(N,2).
free_of_sq(N,N).
free_of_sq(N, K):- Check is K*K, not(0 is N mod Check), K1 is K+1, free_of_sq(N,K1).


%reading the list from the keyboard
%read_list/2
%read_list(+N,-List)
read_list(0, []) :- !.
read_list(N, [Head|Tail]) :- read(Head), NewN is N-1,
read_list(NewN,Tail).



%the sum of the list items, downward recursion
%sum_el_down/2
%sum_el_down(+List,?Sum)
sum_el_down(List, Sum) :- sum_el_down(List, 0, Sum).
sum_el_down([], Sum, Sum) :- !.
sum_el_down([H|T],CurSum, Sum) :- NewSum is CurSum + H,
	sum_el_down(T, NewSum, Sum).



%the sum of the list items, upward recursion
%sum_el_down/2
%sum_el_down(+List,?Sum)
sum_el_up([], 0) :- !.
sum_el_up([H|T], RSum) :-sum_el_up(T, Sum), RSum is H+Sum .


%deleting an element with a specified sum of digits
%remove_el/3
%remove_el(+List,+Sum,-Res)
remove_el([], _, []).
remove_el([H|T], Sum, Res) :- sum_cifr_down(H, SumEl),
    SumEl is Sum, remove_el(T, Sum, Res).
remove_el([H|T], Sum, [H|Res]) :-
    remove_el(T, Sum, Res).


