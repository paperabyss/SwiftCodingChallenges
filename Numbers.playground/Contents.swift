import Cocoa

//Challenge 16: Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
func challenge16() {
    for input in (1...100) {
        if input % 5 == 0 && input % 3 == 0 {
            print("Fizz Buzz!")
        } else if input % 5 ==  0 {
            print("Fizz")
        } else if input % 3 == 0 {
            print("Buzz")
        } else {
            print(input)
        }
    }
}
//challenge16()



//Challenge 17: Write a function that accepts positive minimum and maximum integers, and returns a random number between those two bounds, inclusive.
func challenge17(input1: Int, input2: Int) -> Int {
    var min: Int
    var max: Int

    if input1 > input2 {
        min = input2
        max = input1
    } else {
        min = input1
        max = input2
    }

    return(Int.random(in: min...max))
}

assert(challenge17(input1: 1, input2: 5) >= 1 && challenge17(input1: 1, input2: 5) <= 5)
assert(challenge17(input1: 8, input2: 10) >= 8 && challenge17(input1: 8, input2: 10) <= 10)
assert(challenge17(input1: 12, input2: 12) >= 12 && challenge17(input1: 12, input2: 12) <= 12)
assert(challenge17(input1: 12, input2: 18) != 7)



//Challenge 18: Create a function that accepts positive two integers, and raises the first to the power of the second.
func challenge18(number: Int, power: Int) -> Int {
    guard number > 0 && power > 0 else { return 0}
    var insideNumber = number
    for _ in (1..<power) {
        insideNumber *= number
    }
    return insideNumber
}

assert(challenge18(number: 4, power: 3) == 64, "Challenge 19 failed")
assert(challenge18(number: 2, power: 8) == 256, "Challenge 19 failed")
assert(challenge18(number: 1, power: 1) == 1, "Challenge 19 failed")



//Challenge 19: Swap two positive variable integers, a and b, without using a temporary variable.
func challenge19(a: Int, b: Int) -> (Int, Int) {
    var a = a
    var b = b
    (b,a) = (a,b)

    return (a,b)
}



//Challege 20: “Write a function that accepts an integer as its parameter and returns true if the number is prime.”
func challenge20(number: Int) -> Bool{
    guard number > 1 else { return false }
    guard number != 2 else {return true}

    let largestPossibleMultiple = Double(number).squareRoot()
    for i in (2...Int(largestPossibleMultiple)) {
        if number % i == 0 {
            return false
        }
    }
    return true
}

assert(challenge20(number: 11) == true, "Challenge 20 failed")
assert(challenge20(number: 13) == true, "Challenge 20 failed")
assert(challenge20(number: 4) == false, "Challenge 20 failed")
assert(challenge20(number: 9) == false, "Challenge 20 failed")
assert(challenge20(number: 16777259) == true, "Challenge 20 failed")



//Challenge 21: Create a function that accepts any positive integer and returns the next highest and next lowest number that has the same number of ones in its binary representation. If either number is not possible, return nil for it.
func challenge21(num: Int) -> (Int?, Int?) {
    let binaryNum = String(num, radix: 2)
    let binaryOnes = binaryNum.filter {
        $0 == "1"}

    var nextHighestMatch: Int?
    var nextLowestMatch: Int?

    for i in ((num+1)...Int.max) {
        let insideBinaryOnes = String(i, radix: 2).filter{ $0 == "1"}
        if insideBinaryOnes == binaryOnes {
            nextHighestMatch = i
            break
        }
    }

    for i in (0..<num).reversed() {
        let insideBinaryOnes = String(i, radix: 2).filter{ $0 == "1"}
        if insideBinaryOnes == binaryOnes {
            nextLowestMatch = i
            break
        }
    }

    return(nextLowestMatch,nextHighestMatch)
}
assert(challenge21(num: 12) == (10,17), "Challenge 21 failed")
assert(challenge21(num: 28) == (26,35), "Challenge 21 failed")

//Challenge 22: Create a function that accepts an unsigned 8-bit integer and returns its binary reverse, padded so that it holds precisely eight binary digits.

func challenge22(num: Int) -> Int {
    var binaryNum = String(num, radix: 2)

    while binaryNum.count != 8 {
        binaryNum.insert("0", at: binaryNum.startIndex)
    }

    var revereseBinary = String(binaryNum.reversed())

    var returnNumber = Int(revereseBinary, radix: 2)

    return returnNumber!
}

assert(challenge22(num: 4) == 32, "Challenge 22 failed.")
assert(challenge22(num: 41) == 148, "Challenge 22 failed.")
assert(challenge22(num: 32) == 4, "Challenge 22 failed.")
assert(challenge22(num: 148) == 41, "Challenge 22 failed.")



// Challenge 23: Write a function that accepts a string and returns true if it contains only numbers, i.e. the digits 0 through 9.
func challenge23(input: String) -> Bool {
    var filteredInput = input.components(separatedBy: .decimalDigits).joined()
    return filteredInput.isEmpty
}

assert(challenge23(input: "0101010101") == true, "Challenge 23 failed")
assert(challenge23(input: "123456789") == true, "Challenge 23 failed")
assert(challenge23(input: "9223372036854775808") == true, "Challenge 23 failed")
assert(challenge23(input: "1.01") == false, "Challenge 23 failed")



//Challenge 24: Given a string that contains both letters and numbers, write a function that pulls out all the numbers then returns their sum.
func challenge24(input: String) -> Int {
    var filteredInput = input.components(separatedBy: .decimalDigits.inverted)
    
    var numbers = [0]
    
    for i in filteredInput {
        if Int(i) != nil {
            numbers.append(Int(i)!)
        }
    }

    var total = 0
    for number in numbers {
        total += number
    }

    return total
}

assert(challenge24(input: "a1b2c3") == 6, "Challenge 24 failed.")
assert(challenge24(input: "a10b20c30") == 60, "Challenge 24 failed.")
assert(challenge24(input: "h8ers") == 8, "Challenge 24 failed.")


//Challenge 25: Write a function that returns the square root of a positive integer, rounded down to the nearest integer, without using sqrt().
func challenge25(number: Int) -> Int {
    return Int(pow(Double(number), (0.5)).rounded(.down))
}

assert(challenge25(number: 9) == 3, "Challenge 25 failed.")
assert(challenge25(number: 16777216) == 4096, "Challenge 25 failed.")
assert(challenge25(number: 16) == 4, "Challenge 25 failed.")
assert(challenge25(number: 15) == 3, "Challenge 25 failed.")
