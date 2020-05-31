import UIKit

func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
    var count = 0
    var sum = 0
    var array = signature

    if n == 0 {
        return []
    }
    else {
        for _ in 1...n {
            for item in array.reversed() {
                sum += item
                count += 1
                if count == 3 {
                    array.append(sum)
                    sum = 0
                    count = 0
                    break
                }
            }
        }
        let arraySlice = Array(array.prefix(n))
        return arraySlice
  }
}

tribonacci([0,0,0], 10)
