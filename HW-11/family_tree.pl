
/* The section in the highlighted box above has been completed for you */
/*
    CSE240 Functional Programming 3 Homework
    Database for family tree. It consists of facts and rules.

    Completion time: 6 hours

    @author Kipchun (AJH)
    @version 11/29/2024
*/



/* Facts */
male(abe).
male(rob).
male(jim).

female(joy).
female(ana).

father_of(abe, ana). /* abe is the father of ana */
father_of(abe, rob). /* abe is the father of ana */
father_of(abe, jim). /* abe is the father of ana */

mother_of(joy, rob). /* joy is the mother of rob */
mother_of(joy, jim). /* joy is the mother of rob */
mother_of(joy, ana). /* joy is the mother of rob */

/* Complete the facts given in the diagram above */
/* Rules */
is_male(X) :-
    male(X);
    father_of(X, _).

/* Q. 1.2 */
is_female(X) :-
    female(X);
    mother_of(X, _).

/* Q. 1.3 */
grandmother_of(X, Z) :-
    female(X),
    mother_of(X, Y),
    (father_of(Y, Z); mother_of(Y, Z)).

grandfather_of(X, Z) :-
    male(X),
    father_of(X, Y),
    (father_of(Y, Z); mother_of(Y, Z)).

/* Q. 1.4 */
sibling_of(X, Y) :-
    X \= Y,
    (father_of(Z, X), father_of(Z, Y)); 
    (mother_of(Z, X), mother_of(Z, Y)).

/* Q. 1.5 */
parent_of(X, Y) :-
    mother_of(X, Y);
    father_of(X, Y).

/* Q. 1.6 */
descendent_of(X, Y) :-
    parent_of(Y, X).
descendent_of(X, Y) :-
    parent_of(Y, Z),
    descendent_of(X, Z).