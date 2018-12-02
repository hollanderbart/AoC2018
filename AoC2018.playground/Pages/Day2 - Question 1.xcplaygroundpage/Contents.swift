//: [Previous](@previous)

import Foundation

// Question 1

var accurrencesDictionary: [[Character: Int]] = [[Character: Int]]()

for (mainIndex, element) in input.enumerated() {
    accurrencesDictionary.append([:])
    for (_, character) in element.enumerated() {
        let accurrences = element.filter({ $0 == character }).count
        if accurrences > 1
            && accurrencesDictionary[mainIndex][character] == nil
            && accurrencesDictionary[mainIndex].filter({ $0.value == accurrences }).isEmpty {
            accurrencesDictionary[mainIndex][character] = accurrences
        }
    }
}

var two = 0
var three = 0
accurrencesDictionary.forEach { (accurences) in
    for element in accurences {
        if element.value == 2 {
            two += 1
        } else if element.value == 3 {
            three += 1
        }
    }
}

let checksum = two * three
print("Question 1: \(checksum)")

// Question 2



//: [Next](@next)
