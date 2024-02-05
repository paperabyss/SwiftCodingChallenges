import Cocoa

//Challenge 37: Write an extension for collections of integers that returns the number of times a specific digit appears in any of its numbers.

extension Collection where Iterator.Element == Int {
    func challenge37(count: Int) -> Int {
        var stringArray = [""]
        for i in self {
            stringArray.append(String(i))
        }
        var numberCount = 0

        for i in stringArray {
            let stringNumber = String(i)

            for j in stringNumber {
                if String(j) == String(count) {
                    numberCount += 1
                }
            }
        }

        return numberCount
    }
}

assert([5,15,55,515].challenge37(count: 5) == 6, "Challenge 37 failed.")
assert([5,15,55,515].challenge37(count: 1) == 2, "Challenge 37 failed.")
assert([55555].challenge37(count: 5) == 5, "Challenge 37 failed.")
assert([55555].challenge37(count: 1) == 0, "Challenge 37 failed.")



//Challenge 38: Write an extension for all collections that returns the N smallest elements as an array, sorted smallest first, where N is an integer parameter.
extension Collection where Iterator.Element: Comparable{
    func challenge38(count: Int) -> [Iterator.Element] {
        return Array(self.sorted().prefix(count))
    }
}

assert([1,2,3,4].challenge38(count: 3) == [1,2,3],"Challenge 38 failed")
assert(["q", "f", "k"].challenge38(count: 10) == ["f", "k", "q"], "Challenge 38 failed")
assert([256,16].challenge38(count: 3) == [16,256], "Challenge 38 failed")
assert([String]().challenge38(count: 3) == [], "Challenge 38 failed")



//Extend collections with a function that returns an array of strings sorted by their lengths, longest first.
extension Collection where Iterator.Element == String {
    func challenge39() -> [String] {
        return self.sorted { $0.count > $1.count }
    }
}

assert(["a", "ab", "abc"].challenge39() == ["abc", "ab", "a"], "Challenge 39 failed")
assert(["paul", "taylor", "adele"].challenge39() == ["taylor", "adele", "paul"], "Challenge 39 failed")
assert([].challenge39() == [], "Challenge 39 failed")



//Challenge 40: Create a function that accepts an array of unsorted numbers from 1 to 100 where zero or more numbers might be missing, and returns an array of the missing numbers.
extension Collection where Iterator.Element == Int {
    func challenge40() -> [Int] {
        let fullArray = Array(1...100)
        var usedArray:[Int] = []
        for i in self {
            usedArray.append(i)
        }
        let missingNumbers = Set(fullArray).symmetricDifference(Set(usedArray))
        return Array(missingNumbers).sorted()
    }
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)
assert(testArray.challenge40() == [7, 21,26], "Challenge 40 failed")



//Challenge 41: Write an extension to collections that accepts an array of Int and returns the median average, or nil if there are no values.
extension Collection where Iterator.Element == Int {
    func challenge41() -> Double? {
        guard !self.isEmpty else { return nil}
        var middle: Double
        let numbers = self.sorted()
        if self.count % 2 == 0 {
            let firstMiddle = Double(numbers[numbers.count/2])
            let secondMiddle = Double(numbers[numbers.count/2 - 1])
            middle = (firstMiddle + secondMiddle)/2
        } else {
            var middlePosistion = numbers.count / 2
            middle = Double(numbers[middlePosistion])
        }
        return middle
    }
}

assert([1, 2, 3].challenge41() == 2, "Challenge 41 failed.")
assert([1, 2, 9].challenge41() == 2, "Challenge 41 failed.")
assert([1, 3, 5, 7, 9].challenge41() == 5, "Challenge 41 failed.")
assert([1, 2, 3, 4].challenge41() == 2.5, "Challenge 41 failed.")
assert([Int]().challenge41() == nil, "Challenge 41 failed.")

