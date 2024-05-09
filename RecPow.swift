import Foundation

/**
 Calculates the power of numbers using recursion.
 
 This program reads input from a file named input.txt,
 where each line contains the base and exponent separated by a space.
 It then calculates the power for each line using the recursive function "power",
 and writes the results to a file named output.txt.
 
 - Author: Tamer
 - Version: 1.0
 - Since: 2024-05-06
 */
class RecPow {
    /// Recursive function to calculate power
    ///
    /// - Parameters:
    ///   - base: The base value.
    ///   - exponent: The exponent value.
    /// - Returns: The result of the power operation.
    func power(base: Int, exponent: Int) -> Int {
        if exponent == 0 {
            return 1
        } else {
            return base * power(base: base, exponent: exponent - 1)
        }
    }
    
    /// Main function to execute the power calculation program.
    func main() {
        do {
            // Open input file for reading
            let inputFile = try String(contentsOfFile: "input.txt")
            let lines = inputFile.components(separatedBy: .newlines)
            
            // Open output file for writing
            let outputFile = "output.txt"
            
            // Initialize the file writer
            var outputContent = ""
            
            for line in lines {
                let parts = line.components(separatedBy: " ")
                guard let base = Int(parts[0]), let exponent = Int(parts[1]) else {
                    outputContent += "Error: Non-integer value found in the input.\n"
                    continue
                }
                
                // Calculating power using the recursive function
                let result = power(base: base, exponent: exponent)
                
                // Writing the result to output.txt
                outputContent += "Result for base \(base) and exponent \(exponent): \(result)\n"
            }
            
            // Write content to output file
            try outputContent.write(toFile: outputFile, atomically: true, encoding: .utf8)
            print("Results written to \(outputFile)")
            
        } catch {
            // Handle file IO error
            print("Error: \(error)")
        }
    }
}

// Instantiate and execute the power calculation program
let recPow = RecPow()
recPow.main()
