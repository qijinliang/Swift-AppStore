import UIKit

let badasses = [
    "Jon Snow",
    "Aray Stark",
    "Sansa Strak",
    "Brienne of Tarth",
    "Daenerys Targaryen"
]

let characterToSearchFor = "ABC"

//这里需要计算五次
for badass in badasses {
    if characterToSearchFor == badass {
        
    }else{
        print("nil")
    }
}


let badassesDictionary = [
    "Jon Snow": 1,
    "Aray Stark": 2,
    "Sansa Strak": 3,
    "Brienne of Tarth": 4,
    "Daenerys Targaryen": 5,
    "ABC":6,
]
//这里只需要一步到位
let doesExist = badassesDictionary[characterToSearchFor]
print(doesExist ?? "doesExist->nil")
