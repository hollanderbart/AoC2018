import Foundation

extension CGRect {
    public func intersectingPoints(_ rect2: CGRect) -> [CGPoint] {
        guard self.intersects(rect2) else { return [] }
        let intersection = self.intersection(rect2)
        return (Int(intersection.origin.x)..<Int(intersection.origin.x + intersection.size.width)).flatMap { x in
            (Int(intersection.origin.y)..<Int(intersection.origin.y + intersection.size.height)).map { y in
                return CGPoint(x: x, y: y)
            }
        }
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}

var rectangleInformation = [CGRect]()

for rectangle in input {
    let splitResult = rectangle.split(separator: "@")
//    let number = splitResult.first!.dropFirst().dropLast()
    let positionAndWidth = splitResult.last!.split(separator: ":")
    let position = positionAndWidth.first!.dropFirst()
    let widthAndHeight = positionAndWidth.last!.dropFirst()

    let positionSplitResult = position.split(separator: ",")
    let widthAndHeightSplitResult = widthAndHeight.split(separator: "x")
    let rect = CGRect(x: Int(positionSplitResult.first!)!,
                      y: Int(positionSplitResult.last!)!,
                      width: Int(widthAndHeightSplitResult.first!)!,
                      height: Int(widthAndHeightSplitResult.last!)!)

    rectangleInformation.append(rect)
}

func part1Result() -> Int {
    return rectangleInformation.flatMap { flatMapResult in
        rectangleInformation.filter { $0 != flatMapResult }
            .flatMap { innerFlatMapResult in
                flatMapResult.intersectingPoints(innerFlatMapResult).map(NSValue.init)
        }
        }.unique().count
}

print("Question 1:", part1Result())


private func part2Result() -> Int {
    return rectangleInformation
        .map { rects in
            rectangleInformation
                .filter({ $0 != rects })
                .first(where: { $0.intersects(rects) })
        }
        .firstIndex(where: { $0 == nil })
        .map { $0 + 1 } ?? 0
}

print("Question 2:", part2Result())
