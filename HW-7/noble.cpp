
// Q2b: Define displayRoom() for Noble class (5 points)
// Define the function displayRoom() that you declared within the Noble class in the header file
// See expected output in question file.

// (displayList() function in the hw7.cpp should call this function.)
// Include necessary header files


#include "room.h"
#include "noble.h"

#include <iostream>

void Noble::displayRoom()
{
	// notice that no function call is needed becasue we know this is Noble class function

	std::cout << "Room name " << Noble::getName() << std::endl;
	std::cout << "Room number: " << Noble::getNo() << std::endl;
	std::cout << "Library: Noble" << std::endl;
	std::cout << "" << std::endl;
	
}
