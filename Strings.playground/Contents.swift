import Cocoa

// This file contains my attempts at the Strings section of Swift Coding Challenges by Paul Hudson
// I will put the prompt for each challenge before each.


//Challenge 1: “Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.”

func challenge1(input: String) -> Bool {

    for character in input {
        var characterCount = 0
        for match in input {
            if character == match {
                characterCount += 1
                if characterCount > 1 { return false}
            }
        }
    }
    return true
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")



//Challenge 2: “Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.”

func challenge2(input: String) -> Bool {
    input.lowercased() == String(input.lowercased().reversed())
}

assert(challenge2(input: "rotator") == true, "Challenge 2 failed")
assert(challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
assert(challenge2(input: "Never odd or even") == false, "Challenge 2 failed")
assert(challenge2(input: "Hello, world") == false, "Challenge 2 failed")


//Challenge 3: "“Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.”

func challenge3(input1: String, input2: String) -> Bool {
    input1.sorted() == input2.sorted()
}

assert(challenge3(input1: "abca", input2: "abca") == true, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "cba") == true, "Challenge 3 failed")
assert(challenge3(input1: "a1 b2", input2: "b1 a2") == true, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "abca") == false, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "Abc") == false, "Challenge 3 failed")
assert(challenge3(input1: "abc", input2: "cbAa") == false, "Challenge 3 failed")
assert(challenge3(input1: "abcc", input2: "abca") == false, "Challenge 3 failed")
