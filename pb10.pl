
isPrime(A,A):-!.

isPrime(A,CurrentNumber):-   %% Function must be called with CurrentNumber = 2
                            %% A MUST BE AT LEAST 2, OTHERWISE INFINITE LOOP
  not(0 is A mod CurrentNumber),
  CurrentNumber2 is CurrentNumber + 1,
  isPrime(A,CurrentNumber2).


writeTwicePrimes([],[]).
writeTwicePrimes([1|T],[1|TRES]):-  %% handling the case where A is 1 separately
                                    %% because i can't check it's primality with isPrime() function
  writeTwicePrimes(T,TRES),!.     
writeTwicePrimes([H|T],[H,H|TRES]):-
  isPrime(H,2),
  writeTwicePrimes(T,TRES).
writeTwicePrimes([H|T],[H|TRES]):-
  not(isPrime(H,2)),
  writeTwicePrimes(T,TRES).
