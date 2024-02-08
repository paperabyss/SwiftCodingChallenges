import Cocoa

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
