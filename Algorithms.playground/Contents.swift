import Cocoa

//Challenge 55: Create an extension for arrays that sorts them using the bubble sort algorithm.
extension Array where Element: Comparable {
     func challenge55() -> [Element] {
        guard !self.isEmpty else { return [] }

        var array = self
        var sorted = false
        var swappedItems = 0

        while sorted == false {
            swappedItems = 0
            for (index, i) in array.enumerated() {

                if index == 0 {
                    //do nothing. This will start comparing on the second item in the array.
                } else if i < array[index-1] {
                    array.swapAt(index, index-1)
                    swappedItems += 1
                }
            }
            if swappedItems == 0 {
                sorted = true
            }
        }
         return array
    }
}

assert([12, 5, 4, 9, 3, 2, 1].challenge55() == [1,2,3,4,5,9,12], "Challenge 55 failed.")
assert(["f","a", "b"].challenge55() == ["a","b","f"], "Challenge 55 failed.")
assert([String]().challenge55() == [], "Challenge 55 failed.")



//Challenge 56: Create an extension for arrays that sorts them using the insertion sort algorithm.
extension Array where Element: Comparable {
    func challenge56() -> [Element] {
        guard !self.isEmpty else { return [] }
        var sortedArray: [Element] = []

        for i in self {
            if sortedArray.isEmpty {
                sortedArray.insert(i, at: 0)
            } else {
                for (index, j) in sortedArray.enumerated() {
                    if i < j {
                        sortedArray.insert(i, at: index)
                        break
                    }
                }
            }
        }
        return sortedArray
    }
}

assert([12, 5, 4, 9, 3, 2, 1].challenge56() == [1,2,3,4,5,9,12], "Challenge 56 failed.")
assert(["f","a", "b"].challenge56() == ["a","b","f"], "Challenge 56 failed.")
assert([String]().challenge56() == [], "Challenge 56 failed.")



//Challenge 57: Write a function that accepts two values and returns true if they are isomorphic. That is, each part of the value must map to precisely one other, but that might be itself.
func challenge57(input1: Any, input2: Any) -> Bool {
    var translationValues: [Character: Character] = [:]
    var input1 = Array(String(describing: input1))
    var input2 = Array(String(describing: input2))
    guard input1.count == input2.count else { return false}

    for (index, i) in input1.enumerated() {
        if translationValues[i] != nil {
            if translationValues[i] != input2[index] {
                return false
            }
        } else if translationValues.values.contains(input2[index]) {
            return false
        } else {
            translationValues.updateValue(input2[index], forKey: i)
        }
    }
    return true
}

assert(challenge57(input1: "clap", input2: "slap") == true, "Challenge 57 failed.")
assert(challenge57(input1: "carry", input2: "daddy") == false, "Challenge 57 failed.")
assert(challenge57(input1: [1,2,1,2,3], input2: [4,5,4,5,6]) == true, "Challenge 57 failed.")
assert(challenge57(input1: "curry", input2: "flurry") == false, "Challenge 57 failed.")



//Challenge 58: Write a function that accepts a string containing the characters (, [, {, <, >, }, ], and ) in any arrangement and frequency. It should return true if the brackets are opened and closed in the correct order, and if all brackets are closed. Any other input should false.
func challenge58(input: String) -> Bool {
    var allCharacters = [ "(", "[", "{", "<", ">", "}", "]", ")"]
    var matches = [")":"(", "]":"[", "}":"{", ">":"<"]
    var openings = ["(", "[", "{", "<"]
    guard input.count % 2 == 0 else { return false }
    var input = Array(input)

    //Check that the string only contains letters we want.
    for i in input {
        var i = String(i)
        if !allCharacters.contains(i) {
            return false
        }
    }
    
    var checkString: [String] = []
    for i in input {
        var i = String(i)
        if !openings.contains(i) && checkString.count == 0 {
            return false
        } else if !openings.contains(i) {
            if checkString.last != matches[i] {
                return false
            } else {
                checkString.removeLast()
            }
        } else {
            checkString.append(i)
        }
    }
    return true
}

assert(challenge58(input: "()") == true, "Challenge 58 failed.")
assert(challenge58(input: "([])") == true, "Challenge 58 failed.")
assert(challenge58(input: "([])(<{}>)") == true, "Challenge 58 failed.")
assert(challenge58(input: "}{") == false, "Challenge 58 failed.")
assert(challenge58(input: "([)]") == false, "Challenge 58 failed.")
assert(challenge58(input: "[<<<{}>>]") == false, "Challenge 58 failed.")



//Challenge 59: Create an extension for arrays that sorts them using the quicksort algorithm.
extension Array where Element: Comparable {
    func challenge59(low: Int, high: Int) -> [Element] {
        var pivot = self[Int.random(in: low...high)]
        var lower = pivot
        var higher = self[high]

        while lower < higher {
            lower
        }

        return []
    }
}



//Challenge 60: Create a function that detects whether either player has won in a game of Tic-Tac-Toe.
func challenge60(board: [[String]]) -> Bool {
    var firstLine = board[0]
    var secondLine = board[1]
    var thirdLine = board[2]

    var possibleWins = [
        firstLine,
        secondLine,
        thirdLine,
        [firstLine[0],secondLine[0], thirdLine[0]],
        [firstLine[1],secondLine[1], thirdLine[1]],
        [firstLine[2],secondLine[2], thirdLine[2]],
        [firstLine[0],secondLine[1], thirdLine[2]],
        [firstLine[2],secondLine[1], thirdLine[0]],
    ]
    
    for i in possibleWins {
        if (i.allSatisfy { $0 == "X"}) {
            return true
        } else if (i.allSatisfy { $0 == "O"}) {
            return true
        }
    }
    return false
}

assert(challenge60(board: [["X", "", "O"], ["", "X", "O"], ["", "", "X"]]) == true)
assert(challenge60(board: [["X", "", "O"], ["X", "", "O"], ["X", "", ""]]) == true)
assert(challenge60(board: [["", "X", ""], ["O", "X", ""], ["O", "X", ""]]) == true)
assert(challenge60(board: [["", "X", ""], ["O", "X", ""], ["O", "", "X"]]) == false)
assert(challenge60(board: [["", "", ""], ["", "", ""], ["", "", ""]]) == false)



//Challenge 61: “Write a function that returns an array of prime numbers from 2 up to but excluding N, taking care to be as efficient as possible”
func challenge61(upTo max: Int) -> [Int] {
    var primes: [Int] = []
    for i in (2...max-1) {
        primes.append(i)
    }

    for i in (primes) {
        var total = 0
        var counter = 2
        while total < max {
            total = (i * counter)
            if primes.contains(total) {
                primes.removeAll { $0 == total}
            }
            counter += 1
        }
    }
    return primes
}


assert(challenge61(upTo: 10) == [2,3,5,7], "Challenge 61 failed.")
assert(challenge61(upTo: 11) == [2,3,5,7], "Challenge 61 failed.")
assert(challenge61(upTo: 12) == [2,3,5,7,11], "Challenge 61 failed.")

// Challenge 62: Write a function that accepts an array of CGPoint pairs, and returns an array of the angles between each point pair. Return the angles in degrees, where 0 or 360 is straight up.

func challenge62( points: [(first: CGPoint, second: CGPoint)]) -> [CGFloat] {
    var angles: [CGFloat] = []

    for point in points {
        var angle = (((atan2(point.first.y - point.second.y, point.first.x - point.second.x)) * 180 / Double.pi)-90)
        if angle < 0 {
            angle += 360
        }
        angles.append(angle)
    }
    return angles
}

var points = [(first: CGPoint, second: CGPoint)]()
points.append((first: CGPoint.zero, second: CGPoint(x: 0, y: -100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: -100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: 0)))
points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: 100)))
points.append((first: CGPoint.zero, second: CGPoint(x: 0, y: 100)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: 100)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: 0)))
points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: -100)))

assert(challenge62(points: points) == [0.0, 45.0, 90.0, 135.0, 180.0, 225.0, 270.0, 315.0], "Challenge 62 failed.")



//Challenge: Write a function that accepts a two-dimensional array of integers that are 0 or 1, a new number to place, and a position to start. You should read the existing number at the start position, change it to the new number, then change any surrounding numbers that matched the start number, then change any surrounding those, and so on - like a flood fill algorithm in Photoshop.

func challenge63(fill: Int, in grid: [[Int]], at: (x: Int, y: Int), _ changedNumber: Int? = nil) -> [[Int]] {
    print("Before")
    print(grid)
    print("After")
    var newGrid = grid
    var x = at.x
    var y = at.y
    var tryToChange: [(x: Int, y: Int)] = []
    var numberToChange: Int = grid[y][x]

    func checkSurroundings(x: Int, y: Int ) {
        //This function will put the locations of the numbers surrounding the input into an array to be used later.
     ///   print("Entered new location maker")
        if x > 0 {
            tryToChange.append((x: x-1, y: y))
        }
        if x + 1 < grid[0].endIndex {
            tryToChange.append((x: x+1, y: y))
        }
        if y > 0 {
            tryToChange.append((x: x, y: y-1))
        }
        if y + 1 < grid.endIndex {
            tryToChange.append((x: x , y: y+1))
        }
   ///     print("End of new locations loop. Current locations to check \(tryToChange.count)")
    }

    newGrid[y][x] = fill
    checkSurroundings(x: at.x,y: at.y)

    while tryToChange.count > 0 {
        //If there are still locations left to check, this loop will continue.
     ///   print("Entered While loop")
        for location in tryToChange {
        ///    print("entered for loop at : \(location)")
            if newGrid[location.y][location.x] == numberToChange {
          ///      print("Entered If loop")
                //Changes the matching surrounding number to the desired number.
                newGrid[location.y][location.x] = fill
                //Add the surrounding locations to the check list.
                checkSurroundings(x: location.x, y: location.y)

            }
            //After a location has been checked if it's a match, remove that location from the list of ones remaining to be checked.
            tryToChange.removeAll(where: { $0 == (location.x, location.y)})
         ///   print("left to check: \(tryToChange.count)")
        }
    }
    return newGrid
}

func makeAGrid(_ first: Int, _ second: Int) -> [[Int]] {
    var grid: [[Int]] = []
    for i in  0...second {
        var row: [Int] = []
        for i in 0...first {
            row.append(Int.random(in: 0...1))
        }
        grid.append(row)
    }
    return grid
}
print(challenge63(fill: 5, in: makeAGrid(10, 10), at: (5,5)))

