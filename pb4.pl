accRev([H|T],A,R):-    %% does the reverse
  accRev(T,[H|A],R).
accRev([],A,A).

sum([], [], 0, []):-!. % could enter next clause otherwise, if LeftOver = 0

sum([], [], LeftOver, [LeftOver]).

sum(List1, [], 0, List1):-!. %% could enter next clause if LeftOver = 0
sum([H|T],[],LeftOver,[HRES|TRES]):-
  %inter is H+LeftOver,
  LeftOver2 is floor((H+LeftOver)/10),
  HRES is mod(H+LeftOver,10),
  sum(T,[],LeftOver2,TRES).

sum([],List2,0,List2):-!.  % could enter next clause otherwise
sum([],[H|T],LeftOver,[HRES|TRES]):-
  %inter is H+LeftOver,
  LeftOver2 is floor((H+LeftOver)/10),
  HRES is mod(H+LeftOver,10),
  sum([],T,LeftOver2,TRES).

%% and the general case
sum([H1|T1],[H2|T2],LeftOver,[HRES|TRES]):-
  %inter is (H1+H2),
  %inter2 is inter+LeftOver,
  LeftOver2 is floor((H1+H2+LeftOver)/10),
  HRES is mod(H1+H2+LeftOver,10),
  sum(T1,T2,LeftOver2,TRES).

sumFinal(List1,List2,RES):-
  accRev(List1,[],NewList1),
  accRev(List2,[],NewList2),
  sum(NewList1,NewList2,0,RESinter),
  accRev(RESinter,[],RES).
