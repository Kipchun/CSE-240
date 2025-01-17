/* *
* (checks what kind of opperator that ch is at a given time and does the operation for it)
*
* Completion time : 40 minutes
*
* @author Kipchun (AJH)
* @version 10/20/2024
* IDE: Visual Studio Code
*/


/* This C program demonstrates the switch statement without using breaks. */
#include <stdio.h>

int main() {
    char ch = '+';
    int a = 10, b = 20;
    double f;

    printf("ch = %c\n", ch);
    switch (ch) {
        case '+': f = a + b; printf("f = %.0f\n", f); break;
        case '-': f = a - b; printf("f = %.0f\n", f); break;
        case '*': f = a * b; printf("f = %.0f\n", f); break;
        case '/': f = (double)a / b; printf("f = %.2f\n", f); break;
        default: printf("invalid operator\n");
    }

    ch = '-';
    printf("ch = %c\n", ch);
    switch (ch) {
        case '+': f = a + b; printf("f = %.0f\n", f); break;
        case '-': f = a - b; printf("f = %.0f\n", f); break;
        case '*': f = a * b; printf("f = %.0f\n", f); break;
        case '/': f = (double)a / b; printf("f = %.2f\n", f); break;
        default: printf("invalid operator\n");
    }

    ch = '*';
    printf("ch = %c\n", ch);
    switch (ch) {
        case '+': f = a + b; printf("f = %.0f\n", f); break;
        case '-': f = a - b; printf("f = %.0f\n", f); break;
        case '*': f = a * b; printf("f = %.0f\n", f); break;
        case '/': f = (double)a / b; printf("f = %.2f\n", f); break;
        default: printf("invalid operator\n");
    }

    ch = '/';
    printf("ch = %c\n", ch);
    switch (ch) {
        case '+': f = a + b; printf("f = %.0f\n", f); break;
        case '-': f = a - b; printf("f = %.0f\n", f); break;
        case '*': f = a * b; printf("f = %.0f\n", f); break;
        case '/': f = (double)a / b; printf("f = %.2f\n", f); break;
        default: printf("invalid operator\n");
    }

    ch = '%';
    printf("ch = %c\n", ch); 
    switch (ch) {
        case '+': f = a + b; printf("f = %.0f\n", f); break;
        case '-': f = a - b; printf("f = %.0f\n", f); break;
        case '*': f = a * b; printf("f = %.0f\n", f); break;
        case '/': f = (double)a / b; printf("f = %.2f\n", f); break;
        default: printf("invalid operator\n");
    }

    return 0;
}