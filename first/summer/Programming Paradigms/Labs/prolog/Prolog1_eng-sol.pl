% The following facts should be included in the file:

company(abc).
company(klm).
company(mno).

woman(anna).
woman(maria).
woman(julia).
woman(ewa).
woman(joanna).
woman(lena).
woman(teresa).

man(jan).
man(karol).
man(piotr).
man(tomasz).
man(lukasz).
man(marek).
man(jozef).

% employee(name, surname, company, years_of_work).

employee(anna, klimczak, company(abc), 10).
employee(anna, maj, company(abc), 1).
employee(maria, jankowska, company(abc), 12).
employee(julia, klimczak,  company(abc), 4).
employee(jan, kowal, company(abc), 21).
employee(karol, lis, company(abc), 5).
employee(anna, lis, company(klm), 12).
employee(piotr, bednarek, company(klm), 8).
employee(tomasz, bednarek, company(klm), 2).
employee(ewa, wilk, company(klm), 3).
employee(ewa, lipiec,company(klm), 7).
employee(lukasz, polak,  company(klm), 11).
employee(marek, doba, company(klm), 8).
employee(anna, just, company(mno), 22).
employee(joanna, wilk, company(mno), 16).
employee(piotr, czekaj, company(mno), 4).
employee(maria, wilczak, company(mno), 16).
employee(piotr, kawa, company(mno), 14).
employee(marek, czubak, company(mno), 5).
employee(marek, lis, company(mno), 4).

% ============
% Excerises:
% ============

% NOTE: The character _ denotes an argument with an unimportant name.

% 1) Check in the database if:

% a) there is a woman whose name is lidia;
% in the Prolog window with the file loaded enter the query:
% woman(lidia).

% b) there is an employee whose name is jan;
% in the Prolog window with the file loaded enter the query:
% employee(jan,_,_,_).

% c) there is an employee whose name is jozef;
% in the Prolog window with the file loaded enter the query:
% employee(jozef,_,_,_).

% d) there is an employee whose surname is karolak;
% in the Prolog window with the file loaded enter the query:
% employee(_,karolak,_,_).

% e) there is an employee in the company abc, whose surname is maj.
% in the Prolog window with the file loaded enter the query:
% employee(_,maj,company(abc),_).

 
% 2) Display:

% a) the surnames of all employees whose name is anna;
% in the Prolog window with the file loaded enter the query:
% employee(anna,X,_,_).

% b) the names and years of work of all employees whose surname is lis;
% in the Prolog window with the file loaded enter the query:
% employee(X,lis,_,Y).

% c) the names of companies with employees whose surname is lis;
% in the Prolog window with the file loaded enter the query:
% employee(_,lis,X,_).

% d) the names and surnames of all employees of the company klm;
% in the Prolog window with the file loaded enter the query:
% employee(X,Y,company(klm),_).

% e) the names and surnames of all employees who are men.
% in the Prolog window with the file loaded enter the query:
% employee(X,Y,_,_), man(X).


% 3) Use the appropriate rules to define:

% a) predicate  employee_abc(X,Y), which is true when a person named X and Y is an employee of the company abc;

employee_abc(X,Y) :- employee(X,Y,company(abc),_).

% After loading the file after the changes, we test the new predicate in the Prolog window.

% b) predicate emplOther(X,Y), which is true if a person named X and Y is an employee of a company other than abc;

emplOther(X,Y) :- employee(X,Y,Z,_), Z \= company(abc).

% After loading the file after the changes, we test the new predicate in the Prolog window.

% c) predicate emplWoman(X,Y), which is true if a person named X and Y is a woman employee; 

emplWoman(X,Y) :- employee(X,Y,_,_), woman(X).

% After loading the file after the changes, we test the new predicate in the Prolog window.

% d) predicate longEmpl(X,Y,Z), which is true if a person named X and Y  is working at Z and has a job experience of at least 10 years;

longEmpl(X,Y,Z) :- employee(X,Y,Z,L), L >= 10.

% After loading the file after the changes, we test the new predicate in the Prolog window.

% NOTE: In Prolog "smaller or equal" we write  =<

% e) predicate bonus(X,Y,B), which is true if an employee named X and Y is entitled to a bonus with a value of B; the bonus for an employee is PLN 150 for each year of work.

bonus(X,Y,B) :- employee(X,Y,_,L), B is 150*L.

% After loading the file after the changes, we test the new predicate in the Prolog window.