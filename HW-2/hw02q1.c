/* *
* (Implements a list of macros using the functions defined above)
*
* Completion time : 40 minutes
*
* @author Kipchun (AJH)
* @version 10/22/2024
* IDE: Visual Studio Code
*/


#include <stdio.h>

// Function Definitions
int subf(int a, int b) {
    return a - b;
}

int cubef(int a) {
    return a * a * a;
}

int minf(int a, int b) {
    if (a <= b) {
        return a;
    } else {
        return b;
    }
}

int oddf(int a) {
    if (a % 2 == 1) {
        return 1;
    } else {
        return 0;
    }
}

#define subm(a, b) ((a) - (b))
#define cubem(a) ({ int _a = (a); _a * _a * _a; })

// Revised `minm` macro using a ternary operator
#define minm(a, b) ({int _a = (a); _a <= (b) ? _a : (b); })

#define oddm(a) ((a) % 2 == 1 ? 1 : 0)


int main()
{

    int a = 3, b = 6;

    printf("subf(a, b) = %d\n", subf(a, b));
    printf("subm(a, b) = %d\n", subm(a, b));
    printf("subf(a++, b--) = %d\n", subf(a++, b--));
    a = 3; b = 6; // reset a, b values
    printf("subm(a++, b--) = %d\n", subm(a++, b--));

    // Reset a and b
    a = 3; b = 6;
    
    printf("cubef(a) = %d\n", cubef(a));
    printf("cubem(a) = %d\n", cubem(a));
    printf("cubef(--a) = %d\n", cubef(--a));
    a = 3; b = 6; // reset a, b values
    printf("cubem(--a) = %d\n", cubem(--a));

    // Reset a and b
    a = 3; b = 6;

    printf("minf(a, b) = %d\n", minf(a, b));
    printf("minm(a, b) = %d\n", minm(a, b));
    printf("minf(--a, --b) = %d\n", minf(--a, --b));
    a = 3; b = 6; // reset a, b values
    printf("minm(--a, --b) = %d\n", minm(--a, --b));

    // Reset a and b
    a = 2; b = 6;

    printf("oddf(a) = %d\n", oddf(a));
    printf("oddm(a) = %d\n", oddm(a));
    printf("oddf(a++) = %d\n", oddf(a++));
    a = 2; b = 6; // reset a, b values
    printf("oddm(a++) = %d\n", oddm(a++));

    return 0;
}