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

% occupation(F, T, F, J) is the definition of jet bridge occupation
%                     for F is the fromtime of occupation,
%                     T is the totime of occupation,
%                     Flight is flight,
%                     and J is the number of Jet bridge

occupation(flight(time(6,0), time(6,1), start1, time(6,2), time(10,3)), j1).
occupation(flight(time(6,0), time(6,1), start2, time(6,2), time(6,3)), j2).
occupation(flight(time(6,0), time(6,1), start3, time(6,2), time(6,3)), j3).
occupation(flight(time(6,0), time(6,1), start4, time(6,2), time(6,3)), j4).
occupation(flight(time(6,0), time(6,1), start5, time(6,2), time(6,3)), j5).

occupation(flight(F1,_,Flight1,_,_), J) :-
      occupation(flight(_,_,Flight2,_,T), J),
      dif(Flight1, Flight2),
      flight(_,_,Flight2,_,T),
      compare(T,F1).

% compare(A, B) is that time A is earlier than time B
%
%

compare(time(H1,_), time(H2,_)) :-
      H1 < H2.

compare(time(H1,M1), time(H2,M2)) :-
      H1 == H2,
      M1 < M2.

% gettime(T1,T2,R) return time R is later
gettime(T1, T2, T2) :-
      compare(T1,T2).

gettime(T1, T2, T1) :-
      compare(T2,T1).
