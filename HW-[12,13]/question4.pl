/*

    Author Kipchun (AJH)
    Completion Length: 1.5 hours
    Date: 12/03/2024
    Description: Flattens a list of liststo a single list

*/



my_flatten([], []).

my_flatten(X, [X]) :- \+ is_list(X).

my_flatten([H|T], FlatList) :-
    my_flatten(H, FlatH),
    my_flatten(T, FlatT),
    append(FlatH, FlatT, FlatList).