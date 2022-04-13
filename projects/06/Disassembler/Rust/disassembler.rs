#![allow(non_snake_case)]
use std::collections::HashMap;
use std::env;
use std::path::Path;
use std::fs::File;
use std::io::{BufRead, BufReader};
use std::io::Write;

/** How to run the code **/

//  1. Ensure that Rust is setup on your system
//  You need both rustc and rustup
//      Run rustup --version to check

//      rustup --version Output
//          rustup 1.24.3 (2021-11-09)
//          info: This is the version for the rustup toolchain manager, not the rustc compiler.
//          info: The currently active `rustc` version is `rustc 1.59.0 (9d1b2106e 2022-02-23)`


//  2. Go to the directory where your files are located 
//  You can check if your files are there by running 'ls' in the terminal

//  3. Run the following
//  rustc ./disassembler.rs -o disassembler.out (this is compiling your program)
//  ./disassembler.out "sample.hack" (this is executing your program)

//  ./ indicates the current directory 
//  You will need to substitute "sample.hack" for the appropriate HACK file

fn main() 
{
    let args: Vec<String> = env::args().collect();

    // Check if appropriate file extension
    if args[1].contains(".hack")
    {
        // Check if file exists
        if Path::new(&args[1]).exists()
        {
            let mut file = File::open(&args[1]).unwrap();
            let Lines = BufReader::new(file);

            // Mutable Vector to be used for storing HACK instructions
            let mut hackList = Vec::<String>::new();

            // Computation HashMap
            let compTable = HashMap::from
            ([
                ("101010", "0"),
                ("111111", "1"),
                ("111010", "-1"),
                ("001100", "D"),
                ("110000", "A,M"),
                ("001101", "!D"),
                ("110001", "!A,!M"),
                ("001111", "-D"),
                ("110011", "-A,-M"),
                ("011111", "D+1"),
                ("110111", "A+1,M+1"),
                ("001110", "D-1"),
                ("110010", "A-1,M-1"),
                ("000010", "D+A,D+M"),
                ("010011", "D-A,D-M"),
                ("000111", "A-D,M-D"),
                ("000000", "D&A,D&M"),
                ("010101", "D|A,D|M")
            ]);

            // Destination HashMap
            let destTable = HashMap::from
            ([
                ("000", ""),
                ("001", "M="),
                ("010", "D="),
                ("011", "DM="),
                ("100", "A="),
                ("101", "AM="),
                ("110", "AD="),
                ("111", "ADM=")
            ]);

            // Jump HashMap
            let jumpTable = HashMap::from
            ([
                ("000", ""),
                ("001", ";JGT"),
                ("010", ";JEQ"),
                ("011", ";JGE"),
                ("100", ";JLT"),
                ("101", ";JNE"),
                ("110", ";JLE"),
                ("111", ";JMP")
            ]);


            // Loop through all assembly lines in the HACK file
            for line in Lines.lines() 
            {
                let line = line.unwrap();
                
                // A Instruction
                // if - Check instruction op-code (the first char in the string)
             
                    // Get the remaining substring and convert to decimal 
                    // Conversion
                    //      let value = isize::from_str_radix(&line[1..16], 2).unwrap();
    
                    // Construct the appropriate HACK instruction (I suggest format!)
                    // https://devenum.com/5-ways-to-concatenate-string-in-rust/
    
                    // Append to hackList
                    // https://doc.rust-lang.org/std/vec/struct.Vec.html

                // C Instruction
                // else if - Check instruction op-code (the first char in the string)
                    
                    // Create strings from the appropriate substrings
                    // aBit, cBit, dBit, jBit
                    // Check line 107 
                    // or
                    // https://docs.rs/substring/latest/substring/

                    // Return HACK destination string from destTable using dBit
                    // https://doc.rust-lang.org/std/collections/struct.HashMap.html

                    // Return HACK computation string from compTable using cBit 

                    // Get the appropriate value by splitting on the comma
                    //      let compList: Vec<&str> = returnedVal.split(",").collect();
                    //      let compVal = compList[aBit.parse::<usize>().unwrap()];

                    // Return HACK jump string from jumpTable using jBit

                    // Construct the appropriate HACK instruction
                    
                    // Append to hackList
            }


            // Write to file
            file = File::create(args[1].replace(".hack", ".asm")).expect("Unable to create file");  

            for i in hackList 
            {                                                                                                                                                                  
                if let Err(e) = write!(file, "{}\n", i) 
                {
                    println!("Writing error: {}", e.to_string());
                }                                                                                                                        
            } 
        }
    }
}