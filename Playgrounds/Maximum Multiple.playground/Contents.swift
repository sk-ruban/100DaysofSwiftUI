import UIKit

func maxMultiple(_ d: Int, _ b: Int) -> Int {
    var count = 1
    while true {
        let n = d * count
        if n > b {
            break
        }
        count += 1
    }
    count = count - 1
    return d * count
}

maxMultiple(10, 50)
