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
