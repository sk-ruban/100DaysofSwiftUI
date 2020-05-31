import UIKit

func accum(_ s: String) -> String {
    var phrase = ""
    var count = 1
    for character in s {
        let add = String(repeating: character, count: count).capitalized
        phrase.append(add)
        if count < s.count {
          phrase.append("-")
        }
        count += 1
    }
    return phrase
}

accum("afke")
