import UIKit

/**Function**/
// function을 인자로 받는 function

let a = 10
let b = 20

var inputButton = "*"

func plus(_ num1:Int, _ num2: Int) -> Int {
    return num1 + num2
}

func minus(_ num1: Int, _ num2: Int) -> Int {
    return num1 - num2
}

func multiply(_ num1: Int, num2: Int) -> Int {
    return num1 * num2
}

func displayCalc(result: (Int, Int) -> Int) {
   print("연산결과",  result(a, b))
}

if inputButton == "+"{
    displayCalc(result: plus)
} else if inputButton == "-" {
    displayCalc(result: minus)
} else if inputButton == "*" {
    displayCalc(result: multiply)
}


/** Closure */
// Function과 유사하다
// Function은 이름이 있다.
// Closure 이름이 없다.

func myScore(a: Int) -> String {
    return "\(a)점"
}


// closure 이름을 받아야한다.
let myScore2 = { (a: Int) -> String in
    return "\(a)점"
}

myScore2(30)

// 축약
let myScore3 = { (a: Int)  in // 타입추론으로 리턴 타입 생략 가능
   "\(a)점" // 리턴이 한줄일 경우
}

let myScore5: (Int) -> String = { a in
    "\(a)점"
}

myScore5(500)

let myScore6 : (Int, Int) -> String = {
    "\($0)점 ,  \($1)"
}

myScore6(800, 500)


// Closure 구조
// 조건 -> 찾는다 -> 특정한 글자가 포함된 것들을 찾는다.
// 조건 -> 찾는다 -> 입력한 글자로 시작하는 단어를 찾는다.
let names = ["apple", "air", "brown", "red", "orange", "blue", " candy", "hobby"]

func someFind(find: String) -> [String] {
    var newName = [String]()
    
    for name in names {
        if name.contains(find){
            newName.append(name)
        }
    }
    
    return newName
}

let containsSomeText  : (String, String) -> Bool = { name, find in
    if name.contains(find) {
        return true
    }
    return false
}

let isStartSomeText : (String, String) -> Bool = {name, find in
    if name.first?.description == find {
        return true
    }
    return false
}

func find(findString: String, condition: (String, String) -> (Bool)) -> [String]{
    var newNames = [String]()
    
    for name in names {
        if condition(name, findString) {
            newNames.append(name)
        }
    }
    
    return newNames
}


find(findString: "b", condition:  containsSomeText)
find(findString: "b", condition:  isStartSomeText)

someFind(find: "a")


// Closure 실전
var names2 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sort
let sorted = names2.sorted()
names2.sort()

names2.sort { (lhs, rhs) -> Bool in
    return lhs < rhs
}

// 위 코드를 아래와 같이 축약할 수 있다
names2.sort{$0 < $1}
names2.sort (by: {$0 < $1})
names2.sort(by: <)
names2.sort() {$0 < $1}
