add13715([],_,_,[]).

add13715([H|T],CurrentPos,E,[H,E|TRES]):- %% we call the function with CurrentPos = 1
  CurrentPos == 1,
  CurrentPos2 is CurrentPos+1,
  add13715(T,CurrentPos2,E,TRES),!.

add13715([H|T],CurrentPos,E,[H,E|TRES]):-
  CurrentPos == 3,
  CurrentPos2 is CurrentPos+1,
  add13715(T,CurrentPos2,E,TRES),!.

add13715([H|T],CurrentPos,E,[H,E|TRES]):-
  CurrentPos == 7,
  CurrentPos2 is CurrentPos+1,
  add13715(T,CurrentPos2,E,TRES),!.

add13715([H|T],CurrentPos,E,[H,E|TRES]):-
  CurrentPos == 15,
  CurrentPos2 is CurrentPos+1,
  add13715(T,CurrentPos2,E,TRES),!.

add13715([H|T],CurrentPos,E,[H|TRES]):- %% previous branches have CUTS , so they can't enter here
  CurrentPos2 is CurrentPos+1,
  add13715(T,CurrentPos2,E,TRES),!.


% main function
add(List,E,RES):-
  add13715(List,1,E,RES).
