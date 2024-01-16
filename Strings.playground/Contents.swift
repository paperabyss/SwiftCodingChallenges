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



//Challenge 8: Write a function that accepts two strings, and returns true if one string is rotation of the other, taking letter case into account.
func challenge8(input1: String, input2: String) -> Bool {
    guard input1.count == input2.count else {
        return false
    }
    var doubledouble = input1 + input1

    return doubledouble.contains(input2)
}

assert(challenge8(input1: "abcde", input2: "eabcd") == true, "Challenge 8 failed.")
assert(challenge8(input1: "abcde", input2: "cdeab") == true, "Challenge 8 failed.")
assert(challenge8(input1: "abcde", input2: "abced") == false, "Challenge 8 failed.")
assert(challenge8(input1: "abc", input2: "a") == false, "Challenge 8 failed.")



//Challenge 9: Write a function that returns true if it is given a string that is an English pangram, ignoring letter case.
func challenge9(_ input: String) -> Bool {
    guard input.count > 25 else {return false}

    var alphabet = ["a","b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]
    let lowercased = input.lowercased()

    for letter in alphabet {
        if !lowercased.contains(String(letter)) {

            return false
        }
    }
    return true
}

assert(challenge9("The quick brown fox jumps over the lazy dog") == true, "Challenge 9 failed")
assert(challenge9("The quick brown fox jumped over the lazy dog") == false, "Challenge 9 failed")
assert(challenge9("The five boxing wizards jump quickly.") == true, "Challenge 9 failed")



//Challenge 10: Given a string in English, return a tuple containing the number of vowels and consonants.
func challenge10(_ input: String) -> (Int, Int) {
    let vowels = ["a", "e", "i", "o", "u"]
    let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n","p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    var vCount = 0
    var cCount = 0

    let lowercasedInput = input.lowercased()

    for letter in lowercasedInput {
        if consonants.contains(String(letter)) {
            cCount += 1
        } else if vowels.contains(String(letter)) {
            vCount += 1
        }
    }
    return (vCount, cCount)
}

assert(challenge10("Swift Coding Challenges") == (6,15), "Challenge 10 failed")
assert(challenge10("Mississippi") == (4,7), "Challenge 10 failed")



//Challenge 11: Write a function that accepts two strings, and returns true if they are identical in length but have no more than three different letters, taking case and string order into account.
func challenge11(_ input1: String, _ input2: String) -> Bool {

    guard input1.count == input2.count else { return false }

    let lowercasedInput1 = Array(input1.lowercased())
    let lowercasedInput2 = Array(input2.lowercased())
    var errorCount = 0

    for (location, letter) in lowercasedInput1.enumerated() {
        if lowercasedInput2[location] != letter {
            errorCount += 1
        }
    }
    return errorCount < 4
}

assert(challenge11("clamp", "cramp") == true, "Challenge 11 failed.")
assert(challenge11("clamp", "crams") == true, "Challenge 11 failed.")
assert(challenge11("clamp", "grams") == true, "Challenge 11 failed.")
assert(challenge11("clamp", "grans") == false, "Challenge 11 failed.")
assert(challenge11("clamp", "clam") == false, "Challenge 11 failed.")
assert(challenge11("clamp", "maple") == false, "Challenge 11 failed.")



//Challenge 12: “Write a function that accepts a string of words with a similar prefix, separated by spaces, and returns the longest substring that prefixes all words.”
func challenge12(_ input1: String) -> String {
    var longestSubstring = [""]
    var lastLetter = ""
    var breakOut = false
    var words = Array(input1.components(separatedBy: " "))
    var startingWord = words[0]

    for (location, letter) in startingWord.enumerated() {
        if breakOut == true {
            break
        }
        for word in words {
            var arrayWord = Array(word)
            if arrayWord[location] == letter {
                lastLetter = String(letter)
            } else {
                lastLetter = ""
                breakOut = true
                break
            }
        }
        longestSubstring.append(lastLetter)
        }

    return longestSubstring.joined()
}

assert(challenge12("swift switch swill swim") == "swi", "Challenge 12 failed.")
assert(challenge12("flip flap flop") == "fl", "Challenge 12 failed")



//Challenge 13: Write a function that accepts a string as input, then returns how often each letter is repeated in a single run, taking case into account.
func challenge13(_ input: String) -> String {
    var currentLetter = ""
    var letterCount = 0
    var totalLetterCount = 0

    var output = ""

    for letter in input {
        if String(letter) == currentLetter {
            letterCount += 1
            totalLetterCount += 1
        } else {
            output.append(currentLetter)
            if letterCount > 0 {
                output.append(String(letterCount))
            }
            currentLetter = String(letter)
            letterCount = 1
            totalLetterCount += 1
        }

        if totalLetterCount == input.count {
            output.append(currentLetter)
            output.append(String(letterCount))
        }
    }
    return output
}

assert(challenge13("aabbcc") == "a2b2c2", "Challenge 13 failed.")
assert(challenge13("aaabaaabaaa") == "a3b1a3b1a3", "Challenge 13 failed.")
assert(challenge13("aaAAaa") == "a2A2a2", "Challenge 13 failed.")








