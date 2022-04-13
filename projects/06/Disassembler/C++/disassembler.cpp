#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <sstream>
using namespace std;

/** How to run the code **/

//  1. Ensure that either G++ or MSVC/Clang++ is setup on your system
//  You need some C++ compiler installed on your system
//      Run g++ --version to check (use if you're on Linux)

//      g++ --version Output
//          g++ (GCC) 11.2.0
//          Copyright (C) 2021 Free Software Foundation, Inc.
//          This is free software; see the source for copying conditions.  There is NO
//          warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

//      Run clang++ --version to check (use if you're on macOS/Linux)

//      clang++ --version Output
//          clang version 13.0.1
//          Target: x86_64-pc-linux-gnu
//          Thread model: posix
//          InstalledDir: /usr/bin

// WARNING: If you're using Windows, then you will need to use a more cumbersome method
//          to get either G++ or Clang++ installed. Contact me if you wish to go this
//          route. I highly advise against it, but I will help if you so choose to.


//  2. Go to the directory where your files are located 
//  You can check if your files are there by running 'ls' in the terminal

//  3. Run the following
//  g++ ./disassembler.cpp -o disassembler.out (this is compiling your program)
//  ./disassembler.out "sample.hack" (this is executing your program)

//  Please use "clang++" rather than "g++" if you're using that compiler
//  ./ indicates the current directory 
//  You will need to substitute "sample.hack" for the appropriate HACK file




// Used to split a string into a vector<string>
vector<string> split (const string &s, char delim) 
{
    vector<string> result;
    stringstream ss (s);
    string item;

    while (getline (ss, item, delim)) 
    {
        result.push_back (item);
    }

    return result;
}

// Finds substring in given string
int findSubstring(string fileName)
{
    if (fileName.find(".hack") != string::npos)
    {
        return fileName.find(".hack");
    }

    return -1;
}

// Determines if substring exist
bool checkSubstring(string fileName)
{
    if (findSubstring(fileName) > -1)
        return true;

    return false;
}

// Replaces substring in a given string 
// Used to convert ".hack" -> ".asm"
string replaceSubstring(string fileName)
{
    fileName.replace(findSubstring(fileName), 5, ".asm");

    return fileName;
}

// Converts char to int
int getABitNum(char aBit)
{
    return (aBit - '0');
}

int main(int argc, char *argv[])
{
    fstream file;
    vector<string> Lines;

    // Check if appropriate file extension
    if (checkSubstring(argv[1]))
    {
        // Check if file exists
        file.open(argv[1],ios::in);
        if (file.is_open())
        {
            string tp;
            while(getline(file, tp))
            { 
                Lines.push_back(tp);
            }
            file.close(); 

            // Vector to be used for storing HACK instructions
            vector<string> hackList;

            // Computation Map
            map<string, string> compTable = {
                {"101010", "0"},
                {"111111", "1"},
                {"111010", "-1"},
                {"001100", "D"},
                {"110000", "A,M"},
                {"001101", "!D"},
                {"110001", "!A,!M"},
                {"001111", "-D"},
                {"110011", "-A,-M"},
                {"011111", "D+1"},
                {"110111", "A+1,M+1"},
                {"001110", "D-1"},
                {"110010", "A-1,M-1"},
                {"000010", "D+A,D+M"},
                {"010011", "D-A,D-M"},
                {"000111", "A-D,M-D"},
                {"000000", "D&A,D&M"},
                {"010101", "D|A,D|M"}
            };

            // Destination Map
            map<string, string> destTable = {
                {"000", "\0"},
                {"001", "M="},
                {"010", "D="},
                {"011", "DM="},
                {"100", "A="},
                {"101", "AM="},
                {"110", "AD="},
                {"111", "ADM="}
            };

            // Jump Map
            map<string, string> jumpTable = {
                {"000", "\0"},
                {"001", ";JGT"},
                {"010", ";JEQ"},
                {"011", ";JGE"},
                {"100", ";JLT"},
                {"101", ";JNE"},
                {"110", ";JLE"},
                {"111", ";JMP"}
            };

            // Loop through all assembly lines in the HACK file
            for (int i = 0; i < Lines.size(); i++)
            {
                string line = Lines[i];

                // A Instruction
                // if - Check instruction op-code (the first char in the string)
                    // Get the remaining substring and convert to decimal 
                    // Conversion
                    //      string value = line.substr(1, 15);
                    //      unsigned long long binVal = stoull(value, 0, 2);

                    // Construct the appropriate HACK instruction
                    // https://www.geeksforgeeks.org/methods-to-concatenate-string-in-c-c-with-examples/
                    
                    // Append to hackList
                    // https://www.geeksforgeeks.org/vectorpush_back-vectorpop_back-c-stl/

                // C Instruction
                // else if - Check instruction op-code (the first char in the string)

                    // Get the aBit char directly from the string

                    // Create strings from the appropriate substrings
                    // cBit, dBit, jBit
                    // Check line 175 
                    // or

                    // Return HACK destination string from destTable using dBit
                    // https://www.javatpoint.com/post/cpp-map

                    // Return HACK computation string from compTable using cBit 
                    
                    // Get the appropriate value by splitting on the comma
                    //      vector<string> compList = split(compTable[cBit], ',');
                    //      string compVal = compList[getABitNum(aBit)];

                    // Return HACK jump string from jumpTable using jBit

                    // Construct the appropriate HACK instruction

                    // Append to hackList
            }

            // Write to file
            file.open(replaceSubstring(argv[1]),ios::out);

            if(file.is_open())
            {
                for (int i = 0; i < hackList.size(); i++)
                {
                    file << hackList[i];
                }
                file.close(); 
            }
        }
    }
}