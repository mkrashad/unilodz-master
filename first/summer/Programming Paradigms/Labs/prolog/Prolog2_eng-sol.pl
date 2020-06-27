/* 1) Define a predicate max2(X, Y, Z), which is true when the number Z is equal to the maximum of the numbers X, Y. */

max2(X,Y,Z) :- X>=Y, Z=X.
max2(X,Y,Z) :- Y>=X, Z=Y.

% NOTE: The notation [X | T] means a list with the first element (head) X and tail T, where T is a list. We can also indicate more than one starting element, e.g. [X, Y | T] means that the first two elements of the list are X, Y, and then we have the list T.
% Working with subsequent elements of the list, we mainly use recursive functions.

/* 2) Define a predicate isList(X), which is true when X is a list. */

isList([]).
isList([_|T]) :- isList(T).

/* 3) Define a predicate isMember(X, L), which is true when X is an element of the L list. */

isMember(X,[X|_]).
% better: 
% isMember(X,[X|_]) :- !. 
% The character ! means cutting off, i.e. in such a situation do not go to the next cases.
isMember(X, [_|T]) :- isMember(X,T).

/* 4) Define a predicate myLast(X, L) that is true when X is the last element of the list L. */

myLast(X,[X]).
myLast(X, [_|Y]) :- myLast(X, Y).

/* 5) Define a predicate multiply(L1, L2, L) that is true when the list L consists of the products of corresponding (on the same positions) elements of lists L1, L2. */

multiply([],[],[]).
multiply([X1|Xs],[X2|Ys],[Z|Zs) :- Z is X1*X2,  multiply(Xs,Ys,Zs). 

/* 6) Define a predicate mySum(L, S), which is true when S is the sum of the numbers from the list L. */

mySum([],0).
mySum([X|Xs], S) :- mySum(Xs,S1), S is X+S1.

/* 7) Define a predicate myLength(L, N), which is true when N is the the length of the list L. */

myLength([],0).
myLength([_|L],N) :- myLength(L,N1), N is N1 + 1.