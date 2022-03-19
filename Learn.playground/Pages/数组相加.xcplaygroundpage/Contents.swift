//: [Previous](@previous)

import Foundation

func summation(for numbers: [Int]) -> Int {
    var sum = 0
    numbers.forEach { sum += $0 }
    
    return sum
}

summation(for: [1,2,3,4])


let mySum = [1,2,3,4].reduce(0, { $0  + $1})
print("总和为:", mySum)
