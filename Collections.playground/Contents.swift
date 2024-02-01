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



extension Collection where Iterator.Element: Comparable{
    func challenge38(count: Int) -> [Iterator.Element] {
        return Array(self.sorted().prefix(count))
    }
}

assert([1,2,3,4].challenge38(count: 3) == [1,2,3],"Challenge 38 failed")
assert(["q", "f", "k"].challenge38(count: 10) == ["f", "k", "q"], "Challenge 38 failed")
assert([256,16].challenge38(count: 3) == [16,256], "Challenge 38 failed")
assert([String]().challenge38(count: 3) == [], "Challenge 38 failed")
