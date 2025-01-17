/*

    Author Kipchun (AJH)
    Completion Length: 4 hours
    Date: 12/03/2024
    Description: Implementation of insertion sort script.

*/

/* 
    size-n problem: Sort a list of n elements
    stopping condition: Checks if the list is empty isort([], [])
*/ 

isort([], []).
isort([X], [X]).

/*
    Size-n problem: sort the list with more than one element
    size-m problem: sorts the tail of the list then inserts 
    the first element into the sorted tail
*/

isort([First|Tail], Sorted) :-
    isort(Tail, SortedTail),
    insert(First, SortedTail, Sorted).

/*
    Insert X into the rest of the list if less than or equal to Y
    else insert X into the rest of the list if greater than Y
*/

insert(X, [], [X]).
insert(X, [Y|Rest], [X,Y|Rest]) :- X =< Y.

insert(X, [Y|Rest], [Y|NewRest]) :-
    X > Y,
    insert(X, Rest, NewRest).