/*

    Author Kipchun (AJH)
    Completion Length: 3 hours
    Date: 12/03/2024
    Description: Implementation of quicksort with second element as pivot.

*/

/* 
    size-n problem: Sort a list of n elements
    stopping condition: Empty list or single element list
*/ 

qsort2([], []) :- !.
qsort2([X], [X]) :- !.

/*
    Size-n problem: sort the list with more than one element
    size-m problem: splits the list around second element as pivot,
    then recursively sorts the sublists
*/

qsort2([First,Pivot|Tail], Sorted) :-
    split2(Pivot, [First|Tail], Left, Right),
    qsort2(Left, LeftSorted),
    qsort2(Right, RightSorted),
    append(LeftSorted, [Pivot|RightSorted], Sorted).

/*
    Split the list around pivot:
        Elements <= pivot go to left sublist
        Elements > pivot go to right sublist
*/

split2(_, [], [], []).
split2(Pivot, [X|Tail], [X|Left], Right) :- 
    X =< Pivot, 
    split2(Pivot, Tail, Left, Right).
split2(Pivot, [X|Tail], Left, [X|Right]) :- 
    X > Pivot,
    split2(Pivot, Tail, Left, Right).

/*
    Test case:
    qsort2([8, 3, 4, 12, 25, 4, 6, 1, 9, 22, 6], Sorted).
    Expected: Sorted = [1,3,4,4,6,6,8,9,12,22,25]
*/ 




/*
    Original quicksort implementation for reference
*/

qsort([],[]) :- !.

qsort([Pivot|Tail], Sorted) :-
    split(Pivot, Tail, Left, Right),
    qsort(Left, LeftSorted),
    qsort(Right, RightSorted),
    append(LeftSorted, [Pivot|RightSorted], Sorted).

split(_, [], [], []).

split(Pivot, [X|Tail], [X|Left], Right) :- X =< Pivot, split(Pivot, Tail, Left, Right).
split(Pivot, [X|Tail], Left, [X|Right]) :- X > Pivot, split(Pivot, Tail, Left, Right).
