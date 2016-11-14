
consecutiveCounter([H],RES,RES).
% consecutiveCounter([H1,H2|T],RES,RES):-
%   H1 \== (H2 - 1)

consecutiveCounter([H1,H2|T],CurrentCounter,RES):-   %% FUNCTION MUST BE CALLED WITH CurrentCounter = 1
  H2 is H1 + 1,                                       %% IN THE MAIN FUNCTION WE WILL CHECK RES >=2
  %% DOESN'T WORK WITH H2 = (H1 + 1)
              %% NEITHER WITH H2 == (H1 + 1)
  CurrentCounter2 is CurrentCounter + 1,
  consecutiveCounter([H2|T],CurrentCounter2,RES),!.

consecutiveCounter([H1,H2|T],RES,RES).


%% problem not finished
