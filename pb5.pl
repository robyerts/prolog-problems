%% this replaces the element with ReplaceList, not with it's contents
% subst([],_,_,[]).
% subst([H|T],VAL,ReplaceList,[H|TRES]):-
%   H \== VAL,
%   subst(T,VAL,ReplaceList,TRES).
% subst([H|T],VAL,ReplaceList,[ReplaceList|TRES]):-
%   H == VAL,
%   subst(T,VAL,ReplaceList,TRES).

%%% SAME RESULT
% copyList([],[]).
% copyList([H|T],[H|TRES]):-
%   copyList(T,TRES).
%
% subst([],_,_,[]).
% subst([H|T],VAL,ReplaceList,[H|TRES]):-
%   H \== VAL,
%   subst(T,VAL,ReplaceList,TRES).
% subst([H|T],VAL,ReplaceList,[HRES|TRES]):-
%   H == VAL,
%   copyList(ReplaceList,HRES),
%   subst(T,VAL,ReplaceList,TRES).

subst([],_,_,_,[]).
subst([H|T],VAL,ReplaceList,ReplaceListCopy,[H|TRES]):-
  H \== VAL,
  subst(T,VAL,ReplaceList,ReplaceListCopy,TRES),!.  %%preventing it to enter the last branch
subst([H|T],VAL,[H2|T2],ReplaceListCopy,[H2|TRES]):-
  H == VAL,
  subst([H|T],VAL,T2,ReplaceListCopy,TRES),!. %%% preventing it to enter the last branch
subst([H|T],VAL,[],ReplaceListCopy,RES):-
  subst(T,VAL,ReplaceListCopy,ReplaceListCopy,RES).
