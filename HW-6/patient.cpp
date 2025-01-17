
/* *
* (A directory for storing patient information and displaying the information in a list)
*
* Completion time : 2.5 Hours
*
* @author Kipchun (AJH)
* @version 11/7/2024
* @ide: Visual Studio Community 2022
* @compiler: GCC
*/


#include "patient.h"
#include <iostream>
#include <string>

using namespace std;

// Q1 Patient (2 points)
// Patient() constructor assigns the following default values to class data members
// name: abc
// age: 19
// DOByear: 2000
// ID: 0
Patient::Patient()
{
	name = "abc";
	age = 19;
	DOByear = 2000;
	ID = 0;
}

// Q2 (18 points)
// 2 points for each function

// Define all the class member functions.
// While defining member functions, note that these functions will be called using 
// a 'Patient' object which will represent one patient.
// Eg-  Patient p[10]; creates 10 Patient objects
//		p[2].setAge(19); will set 3rd patient's age to 19

// setName assigns 'name_input' to class data member 'name'
void Patient::setName(string name_input)
{
	this->name = name_input;
}

// setAge assigns age_input to class data member 'age'
void Patient::setAge(int age_input)
{
	this->age = age_input;
}

// setDOByear assigns 'DOByear_input' to class data member 'DOByear'
void Patient::setDOByear(int DOByear_input)
{
	this->DOByear = DOByear_input;
}

// setID assigns 'ID_input' to class data member 'ID'
void Patient::setID(int ID_input)
{
	this->ID = ID_input;
}

// displayPatients displays the name, age, year of birth and ID of the paatient
// See expected output in question file.
void Patient::displayPatient()
{
	// name: abc
	// age: 19
	// DOByear: 2000
	// ID: 0

	std::cout << "Name: " << this->name << std::endl;
	std::cout << "Age: " << this->age << std::endl;
	std::cout << "Year of birth: " << this->DOByear << std::endl;
	std::cout << "ID: " << this->ID << std::endl;

}

// getName returns the class data member 'name'.
string Patient::getName()
{
	return name;
}

// getAge returns the class data member 'age'.
int Patient::getAge()
{
	return age;

}

// getDOByear returns the class data member 'DOByear'.
int Patient::getDOByear()
{
	return DOByear;

}

// getID returns the class data member 'ID'.
int Patient::getID()
{
	return ID;

}
