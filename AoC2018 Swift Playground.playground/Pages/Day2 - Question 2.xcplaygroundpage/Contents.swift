//: [Previous](@previous)

import Foundation

let sortedInput = input.sorted()

//print(sortedInput)

for (_, elementA) in sortedInput.enumerated() {
//    print("A", elementA)
    for (_, elementB) in sortedInput.enumerated() {
//        print("B", elementB)
        let difference = zip(elementA, elementB).filter{ $0 != $1 }
        if difference.count == 1 {
            print(difference)
            var result = elementA
            if let removeCharacterIndex = elementA.index(of: difference[0].0) {
                result.remove(at: removeCharacterIndex)
            }
            print("Question 2: \(result)")
        }
    }
}



//let setY = Set(y.characters)
//let diff = setX.union(setY).subtract(setX.intersect(setY)) // ["b", "B"]

//: [Next](@next)
