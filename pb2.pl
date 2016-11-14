%flux:(i,o)
bubblesort(List, SortedList) :-
	swap(List, NewList),
	bubblesort( NewList, SortedList), !.
bubblesort( SortedList, SortedList).

%flux:(i,o)
swap([H1,H2|T],[H2,H1|T]):-
	H1>H2,!.

swap([H,H|T],Res):-
	swap([H|T],Res),!.

%flux:(i,o)
swap( [H|T], [H|TR]) :-
	swap(T, TR).

%flux:(i,o),
sortSublists([],[]).
sortSublists([H|T],[H|TR]):-
	number(H),
	sortSublists(T,TR).
sortSublists([H|T],[HR|TR]):-
	is_list(H),
	bubblesort(H,HR),
	sortSublists(T,TR).
