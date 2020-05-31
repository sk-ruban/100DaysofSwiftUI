import UIKit

func disemvowel(_ s: String) -> String {
    var phrase = s
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    phrase.removeAll(where: { vowels.contains($0) })
    return phrase
}

disemvowel("LOL JHXJKHQWJFHL AJJAJAJJA;FL")
