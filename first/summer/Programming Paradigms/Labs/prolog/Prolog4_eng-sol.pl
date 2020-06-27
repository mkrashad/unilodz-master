% NOTE: Entering all numbers and strings to read must be finished with a dot.

/* 1) Write a program that reads a given string of characters and then displays the given string. NOTE: the entered string should be ended with a dot. */

rw :- write('Enter somthing: '),read(X), write('Given data: '), writeln(X).

% rw1 - version with the question about repetition, variable A remembers the answer

rw1 :- write('Enter somthing: '),read(X), write('Given data: '), writeln(X), write('Again? y/n'), read(A), A==y -> rw1; write('END'). 

%---
/* 2) Write a program that calculates the arithmetic mean of two numbers given by the user. */

arithm :- write('x='), read(X), write('y='), read(Y), Z is (X+Y)/2, write('The arithmetic mean of x, y is equal to '), write(Z).

/* 3) Write a program that calculates the length of the circle and the area of the disc with the radius specified by the user. */

disc :- write('Enter r= '), read(R), L is 2*R*pi, A is pi*R*R, write('The length of the circle = '), write(L), nl, write('The area of the disc = '), write(A).

/* 4) Write a program that loads the list of items given by the user in succession until the specified character or string is entered, and then displays the created list. */

myList(L) :- writeln('Each element end with a dot. To finish type end.'), rw2([],L2),reverse(L2,L). /*  the called rw2 predicate is defined below */

rw2(['end'|L],L) :- !. /* typing end. finishes the work */
rw2(L1,L) :-  write('Put an element '), read(X), rw2([X|L1],L).

/* 5) Write a program that reads the text entered by the user and save it in a file with the name indicated in the program code. */

mytext :- write('Enter some text: '), /* text containing spaces or beginning with a capital letter should be enclosed in apostrophes or in quotation marks */
	read(T),
	open('test.txt',write,X), /* open a file with the given name for writing and associate it with the variable X */
	current_output(CO), /* saving the previous default output under the CO variable */
	set_output(X), /* setting the X file as the default output */
	write(T), /* write T text to the file */
	close(X), /* closing the file */
	set_output(CO). /* setting the original default output that was saved in CO */ %

/* 6) Write a program that reads the contents of a certain file and saves it in the second file, changing all letters to uppercase.
	a) File names are given in the program code.
	b) File names are read. */
	
% NOTE: In the read file, lines beginning with a capital letter or containing spaces should be enclosed in single quotation marks or quotation marks and each line must end with a dot.

% common for points a), b) predicates for reading terms from a file in sequence and changing all letters to uppercase in them until the end of file character
% string_upper - a built-in predicate

myFile :- read(Term), myterm(Term).

myterm( end_of_file ) :- !.
myterm(Term) :- string_upper(Term,L), write(L), flush, nl, myFile.

% a)

files_a :-
	open('aa.txt',read,X),
	open('bb.txt',write,Y),	
	current_input(CI),
	set_input(X),
	current_output(CO),
	set_output(Y),
	myFile,
	close(X),
	close(Y),
	set_input(CI),
	set_output(CO).
	
% b) the built-in predicate term_to_atom unifies the entered string (first argument -term) with the second argument, which is to be an atom

files_b :-
	write('Type the name of the file for reading '),
	read(P1),
	term_to_atom(P1,P11),
	write('Type the name of the file for writing '),
	read(P2),
	term_to_atom(P2,P22),
	open(P11,read,X),
	open(P22,write,Y),	
	current_input(CI),
	set_input(X),
	current_output(CO),
	set_output(Y),
	myFile,
	close(X),
	close(Y),
	set_input(CI),
	set_output(CO).