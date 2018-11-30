% CPSC 312 Project 2: Flight Control
% Define Jet Bridge and Runway for the arrangement of flight
%

% flight(AT, JBT, N, DT) is the definition of flight with
%                         arrival time AT, arrival jetbridge time JBT, flight number N,
%                         departure time DT

flight(time(6,0), time(6,1), start1, time(10,3)).
flight(time(6,0), time(6,1), start2, time(6,3)).
flight(time(6,0), time(6,1), start3, time(6,3)).
flight(time(6,0), time(6,1), start4, time(6,3)).
flight(time(6,0), time(6,1), start5, time(6,3)).

% jetbridge(N, L) is a jetbridge with name N and the list of plane L
jetbridge(jb1, [flight(time(6,0), time(6,1), start1, time(10,3))]).
jetbridge(jb2, [flight(time(6,0), time(6,1), start2, time(6,3))]).
jetbridge(jb3, []).
jetbridge(jb4, [flight(time(6,0), time(6,1), start4, time(6,3))]).
jetbridge(jb5, []).

% addbridge(J, F, R) is that add a flight name F to one of jet bridge with name J
%                           and result R
addbridge(J, F, R) :-
    flight(AT, JBT, F, DT),
    jetbridge(J, L),
    newflight(L, flight(AT, JBT, F, DT), R).

% addbridge(J, F, R) is that add a flight name F to a jet bridge J that can be empty earlier.
%
addbridge(J, F, R) :-
    jetbridge(J, [flight(A1,JB1,Flight1,D1)|T]),


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
newflight([flight(A1,JB1,Flight1,D1)|T], flight(A2,JB2,Flight2,D2),
          [flight(A2,JB2,Flight2,D2),flight(A1,JB1,Flight1,D1)|T]) :-
          compare(D1,A2),
          dif(Flight1,Flight2).
