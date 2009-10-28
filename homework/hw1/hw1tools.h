#ifndef HW1TOOLS_H
#define HW1TOOLS_H

/*
    Author:     Grant G. Moy III, ID #W99294236
    Date:       10 September 2009
    Classs:     CS177 - FA 2009
    Objective:  Header file for mysize.cpp
*/

#include<iostream>
#include<fstream>
#include<string>

using namespace std;

long fsize(string);
void errmsg(int);
int cntchar(string,int[]);
string getchar(int);
void printout(int[],int);

/***********************************cntchar()************************/
//  Read file character by character, store in ascii array
int cntchar(string fname, int charlist[])
{
    char c;
    int counter = 0;
    fstream ifs;
    ifs.open(fname.c_str(), ios::in);
    if(ifs.fail()) errmsg(1);
    while(ifs.get(c))
    {
        counter++;
        charlist[c]++;
    }
    ifs.close();
    return (counter);
}  // end cntchar

/*************************************fsize()************************/
//  Determine file size by using pointers in memory
long fsize(string fname)
{
    long size;
    fstream fs;

    fs.open (fname.c_str(), ios::in);
    if (fs.fail()) errmsg(1);
    fs.seekg(0L, ios::end);
    if (fs.fail()) errmsg(2);
    size = fs.tellg();
    fs.close();
    if (fs.fail()) errmsg(3);
    return(size);
}  // end fsize

/************************************errmsg()************************/
//  Error messages
void errmsg(int code)
{
    switch(code)
    {    
        case 1: cerr << "Cannot open file \n"; exit(1);
        case 2: cerr << "seekg failed \n";     exit(2);
        case 3: cerr << "close failed \n";     exit(3);
        case 4: cerr << "Empty file \n";       exit(4);
        default: cerr << "unspecified err \n"; exit(5);
    }
}  // end errmsg

/***********************************gettchar()************************/
//  Returns a string with the ascii character matching the index
string getchar(int index)
{
    string nonprt="NULSOHSTXETXEOTENQACKBELBS HT LF VT FF CR SO SI ";
    nonprt += "DLEDC1DC2DC3DC4NAKSYNETBCANEM SUBESCFS GS RS US SPC";

    string rtn = "\' \'";
    if(index <= 32) return(nonprt.substr(index*3,3));
    else if (index == 127) return("DEL");
    rtn[1] = (char)index;
    return (rtn);
}  // end getchar

/**********************************printout()************************/
//  Prints out the breakdown of the characters
void printout(int list[], int min)
{
    int max = 1;
    string minChar = "";
    string maxChar = "";

    for(int i = 0; i <= 127; i++)
    {
        if (list[i] > 0)
        {
            cout << "Total number of " << getchar(i) << " is: ";
            cout << list[i] << endl;
            if (list[i] < min)
            {
                min = list[i];
                minChar = "";
            }
            if (list[i] == min) minChar += (getchar(i) + " ");
            if (list[i] > max)
            {
                max = list[i];
                maxChar = "";
            }
            if (list[i] == max) maxChar += (getchar(i) + " ");
        }
    }
    cout << "Most character used (" << max << "): " << maxChar << endl;
    cout << "Least character used (" << min << "): " << minChar << endl;
}
#endif
