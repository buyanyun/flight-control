% CPSC 312 Project 2: Flight Control
% Define Jet Bridge and Runway for the arrangement of flight
%

% flight (EAT, AAT, N, EDT, ADT) is the definition of flight with
%                         estimate arrival time EAT, actual arrival time AAT, flight number N,
%                         estimate departure time EDT, and actual departure time ADT

flight (time(6,42), time(6,38), ac8306, time(8,50), time(8,48)).
flight (time(6,44), time(6,34), ac8411, time(7,0), time(7,3)).
flight (time(6,45), time(6,51), ac8220, time(18,25), ADT).
flight (time(6,50), time(7,48), ac8176, time(22,30), ADT).
flight (time(6,55), time(6,38), ac201, time(7,0), time(6,56)).
flight (time(6,59), time(6,48), ac8202, time(7,25), time(8,09)).
flight (time(7,0), time(7,8), ac45, time(12,10), ADT).
flight (time(7,1), time(6,48), ac8351, time(8,50), time(8,47)).
flight (time(7,5), time(7,16), ws3364, EDT, ADT).
flight (time(7,5), time(7,5), kd411, time(7,50), time(7,50)).
flight (time(7,7), time(7,20), ws3114, time(8,25), time(8,23)).
flight (time(7,10), time(7,1), ac1830, time(17,50), ADT).
flight (time(7,11), time(6,51), ws3345, time(8,0), time(8,3)).
flight (time(7,15), time(7,15), ix100, time(8,0), time(8,0)).
flight (time(7,15), time(8,12), ac36, EDT, ADT).
flight (time(7,18), time(7,37), ws307, time(8,55), time(8,52)).
flight (time(7,19), time(7,1), ws1875, time(9,10), time(9,09)).
flight (time(7,20), time(7,32), ac536, time(8,30), time(8,35)).
flight (time(7,25), time(7,25), p100, time(8,0), time(8,0)).
flight (time(7,25), time(7,17), ws3290, time(8,5), time(8,2)).
flight (time(7,26), time(7,21), ac233, time(8,50), time(8,48)).
flight (time(7,27), time(7,29), ac8577, time(9,00), time(8,55)).
flight (time(7,29), time(7,50), ac8571, time(15,00), ADT).
flight (time(7,30), time(7,30), p740, time(10,00), ADT).
flight (time(7,30), time(7,30), p750, time(7,45), time(7,45)).
flight (time(7,30), time(7,48), ac34, time(9,0), time(9,15)).
flight (time(7,30), time(7,34), ac8054, time(8,05), time(8,06)).
flight (time(7,32), time(7,20), ws1853, time(9,25), ADT).
flight (time(7,32), time(7,31), ws689, time(9,0), time(8,58)).
flight (time(7,33), time(7,22), ac8237, time(8,5), time(8,6)).
flight (time(7,35), time(7,35), p200, time(8,20), time(8,45)).
flight (time(7,39), time(8,53), ws1883, time(8,30), time(8,27)).
flight (time(7,44), time(7,17), ws1865, time(9,45), ADT).
flight (time(7,47), time(7,43), ac8256, time(8,30), time(8,25)).
flight (time(7,51), time(7,54), ws171, time(9,0), time(8,53)).

% occupation (F, T, Flight, J) is the definition of jet bridge occupation
%                     for F is the fromtime of occupation,
%                     T is the totime of occupation,
%                     Flight is flight,
%                     and J is the number of Jet bridge

occupation (flight(_,F,_,_,T), J) :-
      \+ occupation (flight(_,F1,_,_,_), J),
      compare(F,F1),
      compare(F1,T).

occupation (flight(_,F,_,_,T), J) :-
      \+ occupation (flight(_,F1,_,_,T1), J),
      compare(F,F1),
      compare(F1,T).


% compare(A, B) is that time A is earlier than time B
%
%

compare(time(H1,M1), time(H2,M2)) :-
      H1 < H2.

compare(time(H1,M1), time(H2,M2)) :-
      H1 == H2,
      M1 < M2.
