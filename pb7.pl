getMax([],MAX,MAX).     % function must be caleld with a very SMALL INTEGER AS SECOND VALUE
getMax([H|T],CurrentMAX,MAX):-
  H =< CurrentMAX,
  getMax(T,CurrentMAX,MAX).
getMax([H|T],CurrentMAX,MAX):-
  H > CurrentMAX,
  getMax(T,H,MAX).

appendPos([],_,_,[]).
appendPos([H|T],Val,CurrentPos,[CurrentPos|TRES]):- % We call the function with CurrentPos = 1
  H == Val,
  CurrentPos2 is CurrentPos + 1,
  appendPos(T,Val,CurrentPos2,TRES).

appendPos([H|T],Val,CurrentPos,RES):-
  H \== Val,
  CurrentPos2 is CurrentPos + 1,
  appendPos(T,Val,CurrentPos2,RES).

maxPos(List,RES):-
  getMax(List,-99999,MAX),
  appendPos(List,MAX,1,RES).
