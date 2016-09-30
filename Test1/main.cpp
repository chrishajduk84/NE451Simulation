// Author: David Yevick
// Source: A Short Course in Computational Science and Engineering
#include <iostream>
#include <dislin.h>
 
using namespace std;

double array1[] = {1,2,3};
double array2[] = {1,2,3};
int numOfPts = 3;
 
int main(int argc, const char *argv[])
{
    // Some code for defining variables
    // Omitted to avoid copyright problems
    // An example of using DISLIN methods
    qplot(array1,array2,numOfPts);
}
