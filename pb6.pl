accRev([H|T],A,R):-    %% does the reverse
  accRev(T,[H|A],R).
accRev([],A,A).

product([],_,0,[]):-!.
product([],_,LeftOver,[LeftOver]).

product([H|T],Val,LeftOver,[HRES|TRES]):-
  HRES is mod(H * Val + LeftOver, 10),
  LeftOver2 is floor((H * Val + LeftOver)/10),
  product(T,Val,LeftOver2,TRES).

productFinal(List,Val,RES):-
  accRev(List,[],NewList),
  product(NewList,Val,0,RESinter),
  accRev(RESinter,[],RES).
