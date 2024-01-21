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


