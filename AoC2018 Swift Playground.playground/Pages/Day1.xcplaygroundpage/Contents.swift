//: [Previous](@previous)

import Foundation

// Question 1:

let result = input.reduce(0, { $0 + $1 })
print("Question 1: \(result)")

// Question 2:

func processInputListOnDoubleOccurrences() -> Int {
    var calculatedResults: Set<Int> = []
    var result: Int = 0
    for _ in 0...200 {
        result = input.reduce(result) { (input, output) -> Int in
            let frequency = input + output
            if !calculatedResults.contains(frequency) {
                calculatedResults.insert(frequency)
            } else {
                fatalError("Question 2: \(frequency)")
            }
            return frequency
        }
    }
    return result
}

print(processInputListOnDoubleOccurrences())

//: [Next](@next)
