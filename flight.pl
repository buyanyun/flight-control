% CPSC 312 Project 2: Flight Control
% Define Jet Bridge and Runway for the arrangement of flight
%

% flight(EAT, AAT, N, EDT, ADT) is the definition of flight with
%                         estimate arrival time EAT, actual arrival time AAT, flight number N,
%                         estimate departure time EDT, and actual departure time ADT

flight(time(6,0), time(6,1), start1, time(6,2), time(10,3)).
flight(time(6,0), time(6,1), start2, time(6,2), time(6,3)).
flight(time(6,0), time(6,1), start3, time(6,2), time(6,3)).
flight(time(6,0), time(6,1), start4, time(6,2), time(6,3)).
flight(time(6,0), time(6,1), start5, time(6,2), time(6,3)).

% jetbridge(N, L) is a jetbridge with name N and the list of plane L
jetbridge(jb1, [flight(time(6,0), time(6,1), start1, time(6,2), time(10,3))]).
jetbridge(jb2, [flight(time(6,0), time(6,1), start2, time(6,2), time(6,3))]).
jetbridge(jb3, []).
jetbridge(jb4, [flight(time(6,0), time(6,1), start4, time(6,2), time(6,3))]).
jetbridge(jb5, []).

% addtobridge(J, F, R) is that add a flight F to one of jet bridge with name J
%                           and result R
addtobridge(J, F, R) :-
    jetbridge(J, L),
    newflight(L, F, R).


% compare(A, B) is that time A is earlier than time B
%
%

compare(time(H1,_), time(H2,_)) :-
      H1 < H2.

compare(time(H1,M1), time(H2,M2)) :-
      H1 == H2,
      M1 < M2.

% newflight(L, F, R) is that add to a jet bridge, L is previous list of jet bridge,
%                            F is new flight, R is new list

newflight([],F,[F]).
newflight([flight(EA1,AA1,Flight1,ED1,AD1)|T], flight(EA2,AA2,Flight2,ED2,AD2),
          [flight(EA2,AA2,Flight2,ED2,AD2),flight(EA1,AA1,Flight1,ED1,AD1)|T]) :-
          compare(AD1,EA2),
          dif(Flight1,Flight2).
