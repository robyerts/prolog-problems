reverseList([],A,A).
reverseList([H|T],A,RES):-
  reverseList(T,[H|A],RES).

% successor(List,0,List):-!.
% successor([],0,[]):-!.
% successor([],LeftOver,[LeftOver]):-!.
% successor([H|T],LeftOver,[HRES|TRES]):-
%   HRES is mod(H+LeftOver,10),
%   LeftOver2 is floor((H+1)/10),
%   successor(T,LeftOver2,TRES).


successor(List,0,List).   % List is REVERSED before enterrring the function
                          %% RES will contains the result, REVERSED
successor([],0,[]).
successor([],1,[1]).
successor([H|T],1,[HRES|TRES]):-
  HRES is mod(H+1,10),
  LeftOver2 is floor((H+1)/10),
  successor(T,LeftOver2,TRES).

successorFinal(List,RES):-
  reverseList(List,[],NewList),
  successor(NewList,1,RESinter),
  reverseList(RESinter,[],RES).
