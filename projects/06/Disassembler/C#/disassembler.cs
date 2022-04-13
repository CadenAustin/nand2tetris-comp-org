using System;
using System.IO;

/** How to run the code **/

// 1. Ensure that DotNet is setup on your system
// You simply need a dotnet runtime
//    Run dotnet --version to check

//    dotnet --version Output
//       6.0.102


//  2. Go to the directory where your files are located 
//  You can check if your files are there by running 'ls' in the terminal

//  3. Run the following
//  dotnet new console && rm Program.cs (this creates a new project and removes the default file)
//  dotnet run "sample.hack" (this is executing your program)

//  ./ indicates the current directory 
//  You will need to substitute "sample.hack" for the appropriate HACK file


namespace Disassembler
{
   class Program
   {
      static void Main(string[] args)
      {
         // Check if appropriate file extension
         if (args[0].Contains(".hack"))
         {
            // Check if file exists
            if (File.Exists(args[0])) 
            {
               string[] Lines = File.ReadLines(args[0]).ToArray();

               // List to be used for storing HACK instructions
               List<string> hackList = new List<string>();

               // Computation Dictionary
               Dictionary<string, string> compTable =  
               new Dictionary<string, string>()
               {
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

               // Destination Dictionary
               Dictionary<string, string> destTable =  
               new Dictionary<string, string>()
               {
                  {"000", ""},
                  {"001", "M="},
                  {"010", "D="},
                  {"011", "DM="},
                  {"100", "A="},
                  {"101", "AM="},
                  {"110", "AD="},
                  {"111", "ADM="}
               };

               // Jump Dictionary
               Dictionary<string, string> jumpTable =  
               new Dictionary<string, string>()
               {
                  {"000", ""},
                  {"001", ";JGT"},
                  {"010", ";JEQ"},
                  {"011", ";JGE"},
                  {"100", ";JLT"},
                  {"101", ";JNE"},
                  {"110", ";JLE"},
                  {"111", ";JMP"}
               };

               // Loop through all assembly lines in the HACK file
               foreach (string line in Lines)
               {
                  // A Instruction
                  // if - Check instruction op-code (the first char in the char[])
                          
                     // Get the remaining substring and convert to decimal
                     // Conversion
                     //    string value = line.Substring(1, 15);
                     //    int binVal = Convert.ToInt32(value, 2);
                     //    string val = binVal.ToString();

                     // Construct the appropriate HACK instruction
                     // https://docs.microsoft.com/en-us/dotnet/csharp/how-to/concatenate-multiple-strings
                     
                     
                     // Append to hackList
                     // https://thedeveloperblog.com/c-sharp/list-add

                  // C Instruction
                  // else if - Check instruction op-code (the first char in the char[])
 
                        // Get the aBit char directly from the char[]
                        
                        // Create strings from the appropriate substrings
                        // cBit, dBit, jBit
                        // Check line 102 
                        // or
                        // https://www.geeksforgeeks.org/c-sharp-substring-method/

                        // Return HACK destination string from destTable using dBit
                        // https://www.geeksforgeeks.org/c-sharp-dictionary-with-examples/

                        // Return HACK computation string from compTable using cBit 

                        // Get the appropriate value by splitting on the comma
                        //    String[] compList = returnedVal.Split(',');
                        //    string compVal = compList[(int)char.GetNumericValue(aBit)];

                        // Return HACK jump string from jumpTable using jBit

                        // Construct the appropriate HACK instruction

                        // Append to hackList
               }

               // Write to file
               File.WriteAllLines(args[0].Replace(".hack", ".asm"), hackList);
            }
         }
      }
   }
}