/* 1) Define a predicate element_at(X,L,K) that is true when X is the K'th element of the list L. */

element_at(X,[X|_],1).
element_at(X,[_|L],K) :- K > 1, K1 is K - 1, element_at(X,L,K1).

/* 2) Define a predicate dupli(L1,L2), which is true when L2 is obtained from L1 by duplicating all elements, eg. L1=[1,4,5,1], L2=[1,1,4,4,5,5,1,1]. */

dupli([],[]).
dupli([X|Xs],[X,X|Ys]) :- dupli(Xs,Ys).

/* 3) Define a predicate my_reverse(L1,L2), which is true when L2 is the list obtained from L1 by reversing the order of the elements. */

% NOTE: reverse is a built_in predicate

my_reverse(L1,L2) :- my_rev(L1,L2,[]). /*  we use the three argument predicate my_rev defined below, the third argument is for "collecting" the elements (accumulator), at the beginning it is an empty list */

my_rev([],L2,L2) :- !. /* if we have an empty list, then the third argument is to be our result list and that's it */
my_rev([X|Xs],L2,Acc) :- my_rev(Xs,L2,[X|Acc]). /* subsequent elements of the output list are added to the third argument - accumulator */%

/* 4) Define a predicate end(X,L1,L2) that is true when L2 is the list obtained from the list L1 by adding the element X at the end of L1. */

start(X,L,[X|L]). /* we define an additional predicate, which adds an element X to the list L at the beginning, the result is the third argument */

end(X,L,W) :- my_reverse(L,W1), start(X,W1,W2), my_reverse(W2,W). /* as a result of reversing the list L we have the list W1, at the beginning of W1 we add the element X and we get W2, we reverse W2 to get W */ %

/* 5) Define a predicate remove_at(X,L,K,R), which is true when X is the K'th element of the list L and R is the list that remains when the K'th element is removed from L. */

remove_at(X,[X|Xs],1,Xs).
remove_at(X,[Y|Xs],K,[Y|Ys]) :- K>1, K1 is K-1, remove_at(X,Xs,K1,Ys).

/* 6) Define a predicate take(L1,N,L2), which is true when the list L2 contains the N initial elements of the list L1. */

/* 7) Define a predicate my_flatten(L1,L2) that is true when the list L2 is obtained from the list L1 by flattening; i.e. if an element of L1 is a list then it is replaced by its elements, recursively. Example: L1=[a,b,[c,d,[e,f]]], L2=[a,b,c,d,e,f]. */

% NOTE: \ + means the negation operator, is_list is a built-in predicate

my_flatten([],[]).
my_flatten([X|Xs], Y) :- \+ is_list(X), Y=[X|Ys], my_flatten(Xs,Ys). 
my_flatten([X|Xs], Y) :- is_list(X), my_flatten(X,X2), my_flatten(Xs,Ys), append(X2,Ys,Y).

