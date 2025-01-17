/*
    CSE240 Functional Programming 3 Homework
    Simple database script for determining the food and shopping list at a specific meal.

    Completion time: 4 hours

    @author Kipchun (AJH)
    @version 11/29/2024
*/

/* Facts */

/ * Q. 2.1 * /


entre(lunch, sandwich).
entre(dinner, spaghetti).

side(lunch, chips).
side(lunch, lemonade).
side(dinner, bread).
side(dinner, greentea).

ingredient(chips, potato).
ingredient(chips, salt).
ingredient(lemonade, lemon).
ingredient(lemonade, sugar).
ingredient(bread, egg).
ingredient(bread, flour).
ingredient(greentea, green).
ingredient(greentea, tea).

/* Rules */

/ * Q. 2.2 * /
meal(lunch, Y) :- 
    entre(lunch, _X),  
    side(lunch, Y).
    
meal(dinner, Y) :- 
    entre(dinner, _X), 
    side(dinner, Y).

/ * Q. 2.3 * /
shoppinglist(lunch, Y) :- 
    side(lunch, S), 
    ingredient(S, Y).

shoppinglist(dinner, Y) :- 
    side(dinner, S), 
    ingredient(S, Y).


