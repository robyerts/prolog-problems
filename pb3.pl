occur([], _ ,0).
occur([H|T],VAL,COUNT):-
  H == VAL,
  occur(T, VAL, COUNT2),
  COUNT is COUNT2 + 1.
occur([H|T],VAL,COUNT):-
  H \== VAL,
  occur(T,VAL,COUNT).

removeDuplicates([],_,[]).
removeDuplicates([H|T], DUP, RES):-
  occur(DUP, H, COUNT),
  COUNT == 2, %% therefore, we keep the values with a number of occurencies !=2
  removeDuplicates(T,DUP,RES),!.
removeDuplicates([H|T], DUP, [H|TRES]):-
  removeDuplicates(T, DUP, TRES).


mergeSorted([], [], []).

mergeSorted(List1, [], List1).

mergeSorted([], List2, List2).

mergeSorted([H1|T1],[H2|T2],[H1|TRES]):-
  H1 =< H2,
  mergeSorted(T1,[H2|T2],TRES).

mergeSorted([H1|T1],[H2|T2],[H2|TRES]):-
  H1 > H2,
  mergeSorted([H1|T1],T2,TRES).

merge(List1,List2,Res):-
  removeDuplicates(List1,List1,NewList1),
  removeDuplicates(List2,List2,NewList2),
  mergeSorted(NewList1, NewList2, Res).
