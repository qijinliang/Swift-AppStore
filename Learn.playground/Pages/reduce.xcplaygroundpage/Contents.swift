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


func productFunction(for numbers: [Int]) -> Int {
    var product = 1
    
    numbers.forEach { (num) in
        product *= num
    }
    return product
}

productFunction(for: [1,2,3,4])
let myproduct = [1,2,3,4,5].reduce(1, { $0 * $1 })
print("myproduct:",myproduct)

let facts = ["Brian", "is" , "the" , "greatest" , "of" , "all" , "time"]

func transformIntonSentence(for words: [String]) -> String {
    var initialResult = ""
    words.forEach {initialResult += $0 + " "}
    return initialResult
}

transformIntonSentence(for: ["Brian", "is" , "the" , "greatest" , "of" , "all" , "time"])
let trueFacts = facts.reduce("", {$0 + $1 + " "})

print("trueFacts:",trueFacts)
