occur([], _ ,0).
occur([H|T],VAL,COUNT):-
  H == VAL,
  occur(T, VAL, COUNT2),
  COUNT is COUNT2 + 1.
occur([H|T],VAL,COUNT):-
  H \== VAL,
  occur(T,VAL,COUNT).

remove([],_,[]).
remove([H|T],VAL,RES):-
  H == VAL,
  remove(T,VAL,RES).
remove([H|T],VAL,[H|TRES]):-
  H \== VAL,
  remove(T,VAL,TRES).


removeDuplicates([],_,[]).
removeDuplicates([H|T], DUP, RES):-
  occur(DUP, H, COUNT),
  COUNT == 2, %% therefore, we keep the values with a number of occurencies !=2
  removeDuplicates(T,DUP,RES),!.
removeDuplicates([H|T], DUP, [H|TRES]):-
  removeDuplicates(T, DUP, TRES).


%%% bubble Sort baby
bubbleSort(List,SortedList):-
  swap(List,NewList),
  bubbleSort(NewList,SortedList),!.
bubbleSort(SortedList,SortedList).

swap([H1,H2|T],[H2,H1|T]):-
  H1 > H2,!.
swap([H|T],[H|TRES]):-
  swap(T,TRES).
%%%%%%%%%%%

sortt(List, SortedList):-
  removeDuplicates(List,List,NewList),
  bubbleSort(NewList, SortedList).
