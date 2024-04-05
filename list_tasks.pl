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



%min element
min_el([X], X).
min_el([X,Y|T], Min) :- X =< Y,  min_el([X|T], Min).
min_el([X,Y|T], Min) :-  X > Y,  min_el([Y|T], Min).

%find pred element for last min
%find_pred_min/2
%find_pred_min(+List,?Res)
find_pred_min(List, Res):- min_el(List, Min), find_pred_min(List,Min,0,
0,Res).
find_pred_min([H,Min|T],Min,K,K,H):-T=[],!.
 find_pred_min([Min|T],Min,CurK,K,Res):-K1 is K+1,
 find_pred_min(T,Min,CurK,K1, Res).
 find_pred_min([H|T],Min,CurK,K,Res):-not(T=[]),find_pred_min(T,Min,CurK,K,Res).


%find max element
max_el([X], X).
max_el([X,Y|T], Max) :- X >= Y,  max_el([X|T], Max).
max_el([X,Y|T], Max) :-  X < Y,  max_el([Y|T], Max).

%find elements between first max and second max
%find_between_max/2
%find_between_max(+List, ?Res).
find_between_max(List,Res):- max_el(List, Max), find_between_max(List, Max,[],Res).
find_between_max([Max|T],Max,Res1,Res):-find_two_max(T,Max,Res1,Res).
find_between_max([H|T],Max,Res1,Res):-find_between_max(T,Max,Res1,Res).
find_two_max([Max|_],Max,Res1,Res1):-!.

 find_two_max([H|T],Max,Res1,Res):- append(Res1,[H],R), find_two_max(T,Max, R, Res).





%find the position of the first minimal element
position_min([Min|_], Min, 0).
position_min([H|T], Min, Pos) :-
    position_min(T, Min, Pos1),
    Pos is Pos1 + 1.

% find the position of the last minimal element
last_position_min(List, Min, Pos) :-
    reverse(List, Reversed),
    position_min(Reversed, Min, Pos1),
    length(List, Len),
    Pos is Len - Pos1 - 1.

%find the number of elements between the first and the last minimum
%count_between_min/2
%count_between_min(+List,?Count)
count_between_min(List, Count) :-
    min_el(List, Min),
    position_min(List, Min, FirstPos),
    last_position_min(List, Min, LastPos),
    Count is (LastPos-FirstPos)  - 1.



