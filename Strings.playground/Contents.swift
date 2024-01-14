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



//Challenge 4: Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.
extension String {
    func fuzzyContains(_ input :String ) -> Bool {
        return self.lowercased().range(of: input.lowercased()) != nil
    }
}

assert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
assert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")



//Challenge 5: Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.
func challenge5(string: String, count: Character) -> Int {
    var moddifiedString = string

    moddifiedString.removeAll {
        $0 == count
    }

    return string.count - moddifiedString.count
}

assert(challenge5(string: "The rain in Spain", count: "a") == 2, "Challenge 5 failed.")
assert(challenge5(string: "Mississippi", count: "i") == 4, "Challenge 5 failed.")
assert(challenge5(string: "Hacking with Swift", count: "i") == 3, "Challenge 5 failed.")



//Challenge 6: Write a function that accepts a string as its input, and returns the same string just with duplicate letters removed.
func challenge6(_ input: String) -> String {
    var output = ""

    for letter in input {
        if !output.contains(letter){
            output.append(letter)
        }
    }
    return output
}

assert(challenge6("wombat") == "wombat", "Challenge 6 failed.")
assert(challenge6("hello") == "helo", "Challenge 6 failed.")
assert(challenge6("Mississippi") == "Misp", "Challenge 6 failed.")



//Challenge 7: Write a function that returns a string with any consecutive spaces replaced with a single space.

func challenge7(_ input: String) -> String {
    var output = ""
    var lastUsed = ""

    for character in input {
        if character != " " {
            output.append(character)
            lastUsed = String(character)
        }
        else if character != Character(lastUsed) {
            output.append(character)
            lastUsed = String(character)
        }
    }

    return output
}

assert(challenge7("This is a test") == "This is a test", "Challenge 7 failed")
assert(challenge7("This is        a test") == "This is a test", "Challenge 7 failed")
assert(challenge7("This    is a test") == "This is a test", "Challenge 7 failed")
assert(challenge7("Thi s is a test") == "Thi s is a test", "Challenge 7 failed")



