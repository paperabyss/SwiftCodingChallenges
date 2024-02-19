import Cocoa
//Since this section of the book deals with the file manager, I want to get it right away for all future challenges.
let fileManager = FileManager.default

//Challenge 27: Write a function that accepts a filename on disk, then prints its last N lines in reverse order, all on a single line separated by commas.
func challenge27(file: String, lines: Int) {
    guard let content = try? String(contentsOfFile: file) else { return }
    var output = ""

    content.components(separatedBy: "\n").reversed()
    for i in 0...min(content.count, lines) {
        output.append("\(content), ")
    }

    output.trimmingCharacters(in: .alphanumerics.inverted)
    print(output)
}


