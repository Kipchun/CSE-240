
// Q2a: Define displayRoom() for Hayden class (5 points)
// Define the function displayRoom() that you declared within the Hayden class in the header file
// See expected output in question file.

// (displayList() function in hw7.cpp should call this function.)
// Include necessary header files

#include "room.h"
#include "hayden.h"

#include <iostream>

void Hayden::displayRoom()
{
	// notice that no function call is needed becasue we know this is Hayden class function

	std::cout << "Room name " << Hayden::getName() << std::endl;
	std::cout << "Room number: " << Hayden::getNo() << std::endl;
	std::cout << "Library: Hayden" << std::endl;
	std::cout << "" << std::endl;
}
