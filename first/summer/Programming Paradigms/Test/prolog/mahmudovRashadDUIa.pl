% Mahmudov Rashad
% 1)
% a)

% third([],_).
third([_,_,L3|_],X) :- X is L3.

% b)
sum13([],_).
sum13([X1,_,X3|_],S) :- S is X1 + X3.


% 2)
addX([], [], _).
addX([L1|Ls], Y2, X) :- N is L1 + X, Y2=[N|Ys], addX(Ls,Ys,X).


% 3)
listStar([],[]).
listStar([X1|Xs],Y) :- N is X1, Y = [N,'*'|Ys], listStar(Xs,Ys).

% 4)
mySquare :-
  write("Enter number A "),
  read(A),
  write("Enter number B "),
  read(B),
  Z is (A-B)^2,
  format("Square the difference of ~w and ~w is ~w ", [A,B,Z]).
