#include <iostream>
#include <string>
#include "hw1tools.h"

using namespace std;

//  Author:    Grant G. Moy II, ID #W99294236
//  Date:      10 September 2009
//  Program:   mysize.cpp
//  Objective: The program will look for own source code and 
//  report it's size then, report breakdown of characters used
//  minimum character(s) and maximum character(s).

int main(int argc, char *argv[])
{
    static int charList[128];
    string fname = argv[0]; 
    fname +=  ".cpp";
    long size;
    int totalc;

    size = fsize(fname);

    if (size > 0) cout << "My size is: " << size << endl;
    else errmsg (4);

    totalc = cntchar(fname, charList);
    printout(charList, static_cast<int>(size));
    cout << "Total character count: " << totalc << endl;
    return 0;
}  // main

