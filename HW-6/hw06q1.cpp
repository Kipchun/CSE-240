/* *
* (A directory for storing patient information and displaying the information in a list)
*
* Completion time : 2.5 Hours
*
* @author Kipchun (AJH)
* @version 11/7/2024
* @ide: Visual Studio Community 2022
* @compiler: Visual Studio
*/

// READ BEFORE YOU START:
// You are given a partially completed program which consist of a class 'Patient' defined in patient.h
// The definitions of class member functions are to be filled in patient.cpp
// hw06q1.c (this file) creates an array of objects 's[]' and uses a menu driven program to add a patient, display patient info, 
// sort the patient list and to find the oldest patient(by age).
// You should start completing the program from from Q1. Question numbers are given around line 33.
// To begin, you should trace through the given code and understand how it works.
// Please read the instructions above each required function and follow the directions carefully.
// If you modify any of the given code, the return types, or the parameters, you risk getting compile error.
// You are not allowed to modify main ().

// ***** WRITE COMMENTS FOR IMPORANT STEPS OF YOUR CODE. *****
// ***** GIVE MEANINGFUL NAMES TO VARIABLES. *****

#include "patient.h"
#include <iostream>
#include <string>

#define MAX_PATIENTS 5

using namespace std;

// forward declaration of functions (already implmented)
void executeAction(char);

// functions that need implementation:
// in patient.cpp :
// Q1 Patient constructor		// 2 points
// Q2 Patient member functions // 18 points

// in this file (hw06q1.cpp) : Q3 to Q6
int addPatient(string name_input, int age_input, int DOByear_input, int ID_input); // 10 points
void displayPatients();				// 5 points
void sort();						// 10 points
void oldestPatient();		// 5 points


Patient s[MAX_PATIENTS];		// array of objects
int currentCount = 0;				// number of patients in the list


int main()
{
	char choice = 'i';		// initialized to a dummy value
	do
	{
		cout << "\nCSE240 HW06\n";
		cout << "Please select an action:\n";
		cout << "\t a: add a new patient\n";
		cout << "\t d: display patient list\n";
		cout << "\t s: sort the patients in descending order based on age (within a range)\n";
		cout << "\t n: display the oldest patient whose name starts with a specific letter\n";
		cout << "\t q: quit\n";
		cin >> choice;
		cin.ignore();			// ignores the trailing \n
		executeAction(choice);
	} while (choice != 'q');

	return 0;
}


// Ask for details from user for the given selection and perform that action
// Read the function case by case
void executeAction(char c)
{
	string name_input;
	int age_input, DOByear_input, ID_input, result = 0;

	switch (c)
	{
	case 'a':	// add patient
		// input patient details from user
		cout << "Please enter patient name: ";
		getline(cin, name_input);
		cout << "Please enter age: ";
		cin >> age_input;
		cin.ignore();
		cout << "Please enter year of birth: ";
		cin >> DOByear_input;
		cin.ignore();
		cout << "Please enter ID: ";
		cin >> ID_input;
		cin.ignore();

		// add the patient to the list
		result = addPatient(name_input, age_input, DOByear_input, ID_input);
		if (result == 0)
			cout << "\nThat patient is already in the list or list is full! \n\n";
		else
			cout << "\nPatient successfully added to the list! \n\n";
		break;

	case 'd':		// display the list
		displayPatients();
		break;

	case 's':		// sort the list
		sort();
		break;

	case 'n':		// find and display oldestt patient
		oldestPatient();
		break;

	case 'q':		// quit
		break;

	default: cout << c << " is invalid input!\n";
	}

}

// Q3 addPatient (10 points)
// This function adds a new patient with the details given in function arguments.
// Add the patient in 's' (array of objects) only if there is remaining capacity in the array and if the patient does not already exist in the list
// This function returns 1 if the patient is added successfully, else it returns 0 for the cases mentioned above.
// Assume user enters age in 0.0 - any positive integer range.
int addPatient(string name_input, int age_input, int DOByear_input, int ID_input)
{
	if (currentCount >= MAX_PATIENTS)
	{
		return 0;
	}

	for (int i = 0; i < currentCount; i++) {
		if (s[i].getID() == ID_input)
		{
			return 0;
		}
	}

	// Setting the values of the new patient in the array
	s[currentCount].setName(name_input);
	s[currentCount].setAge(age_input);
	s[currentCount].setDOByear(DOByear_input);
	s[currentCount].setID(ID_input);
	currentCount++;

	return 1;	// edit this line if needed
}

// Q4 displayPatients (5 points)
// This function displays the list of patients.
// Parse the object array 's' and display the details of all patients in the array. See expected output given in question file.
// You can call the class function 'displayPatients()' here. Note that these are two different functions.
// Patient::displayPatient() displays details of one Patient object, while displayPatients() should display all patients
void displayPatients()
{
	for (int i = 0; i < currentCount; i++) {
		s[i].displayPatient();
		cout << endl;        // add a newline after each patient to separate them in the output.
	}
}

// Q5 sort (10 points)
// This function sorts the patiens in descending order of age within a given range.
// You may use the 'temp' object for sorting logic, if needed.

void sort()
{
	int minAge, maxAge;

	// Asks for the age range to be sorted
	cout << "Enter the lower bound of age: ";
	cin >> minAge;
	cout << "Enter the upper bound of age: ";
	cin >> maxAge;

	// Check if the entered age range is valid. If not, display an error message and exit the function.

	if (minAge > maxAge) {
		std::cout << "Invalid range. Lower bound must be less than upper bound." << endl;
		return;
	}


	// Sorts the list of patients depending on age.

	for (int i = 0; i < currentCount - 1; i++) {
		for (int j = 0; j < currentCount - i - 1; j++) {
			if (s[j].getAge() >= minAge && s[j].getAge() <= maxAge && s[j + 1].getAge() >= minAge && s[j + 1].getAge() <= maxAge) {
				if (s[j].getAge() < s[j + 1].getAge()) {
					Patient temp = s[j];
					s[j] = s[j + 1];
					s[j + 1] = temp;
				}
			}
		}
	}

	displayPatients();

}

// Q6 oldestPatient (5 points)
// This functions displays the patient who is oldest and whose name starts with a specific letter
// Parse the array to check if the patient is the oldest patient based of the character input
// If the patient is the oldest patient year then copy that patient's details (object's data members) 
// to 'newPatient' object created using 'new' and display those patient details using 'newPatient' object.
// Finally delete the 'newPatient' object.
// NOTE: You necessarily have to use the 'newPatient' object to store the patient details in it and delete it after displaying.
//       You should not display patient details using 's[]' object.

void oldestPatient()
{
	char startingCharacter;				// Ask the user for a character

	cout << "Enter the first letter of the patients' first name: ";
	cin >> startingCharacter;

	Patient* newPatient = nullptr;
	int maxAge = s[0].getAge(); // Gets the first patient's age and sets that as the min point of the search.

	for (int i = 0; i < currentCount; i++) {
		if (s[i].getName()[0] == startingCharacter) {
			if (s[i].getAge() > maxAge) {
				maxAge = s[i].getAge();

				if (newPatient != nullptr) {
					delete newPatient; // frees the memory allocated before assigning the new details
				}
				newPatient = new Patient();
				newPatient->setName(s[i].getName());
				newPatient->setAge(s[i].getAge());
				newPatient->setDOByear(s[i].getDOByear());
				newPatient->setID(s[i].getDOByear());
			}
		}
	}

	if (newPatient != nullptr) {
		newPatient->displayPatient();
		delete newPatient; // frees the memory allocated for the new patient object
	}

}
