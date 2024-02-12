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



