/*

    Author Kipchun (AJH)
    Completion Length: 3.5 hours
    Date: 12/03/2024
    Description: Checks the neiboring states for miscolored states.

*/


/* Q1. 4 Colors are needed */


/* Q2. Prolog Facts for neighbors */


/* Define the neighbors of the states */
neighbor(arizona, california).
neighbor(arizona, colorado).
neighbor(arizona, nevada).
neighbor(arizona, new_mexico).
neighbor(california, nevada).
neighbor(california, oregon).
neighbor(colorado, new_mexico).
neighbor(colorado, utah).
neighbor(colorado, wyoming).
neighbor(idaho, montana).
neighbor(idaho, nevada).
neighbor(idaho, oregon).
neighbor(idaho, utah).
neighbor(idaho, washington).
neighbor(idaho, wyoming).
neighbor(montana, wyoming).
neighbor(nevada, oregon).
neighbor(nevada, utah).
neighbor(nevada, idaho).
neighbor(utah, wyoming).
neighbor(oregon, washington).


/* Define the colors of the states */
color(arizona, red).
color(california, yellow).
color(colorado, blue).
color(idaho, yellow).
color(montana, green).
color(nevada, blue).
color(new_mexico, yellow).
color(oregon, red).
color(utah, green).
color(washington, blue).
color(wyoming, red).


/* Q3. Adjacent Rule */
adjacent(State1, State2) :- neighbor(State1, State2).
adjacent(State1, State2) :- neighbor(State2, State1).


/* Q4. Miscolor Rule */
miscolor(State1, State2) :- neighbor(State1, State2), color(State1, Color), color(State2, Color).


/* Q5. Query Rule */
q :- miscolor(State1, State2), write('Miscolored states found: '), write(State1), write(' and '), write(State2), nl.
q :- write('No miscolored states found'), nl.