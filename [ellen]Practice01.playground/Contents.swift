import UIKit

// 문자열 중에서 한글자를 랜덤으로 뽑아내는 함수

func randomOutput(_ str: String) -> String {
    return String(str.randomElement()!)
}

let letter : String = randomOutput("안녕하세요")

print(letter)


// 소수 판별해보기
// 소수를 판별하는 함수를 만들어 봅시다. 해당 숫자가 소수인 경우 "소수입니다"를 출력하고
// 소수가 아닌 경우 "소수가 아닙니다"를 출력하도록 합시다

func isPrimeNumber(_ num: Int) -> String {
    if num < 4 {
        return num == 1 ? "소수가 아닙니다" : "소수 입니다"
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) {return "소수가 아닙니다"}
    }
    return "소수 입니다."
}


isPrimeNumber(17)


var num = 9
var isPrime: Bool = true

for i in 2..<num {
    if num % i == 0 {
        isPrime = false
        break
    }
}

if isPrime {
    print("소수입니다")
} else {
    print("소수가 아닙니다")
}


// 팩토리얼 함수
func factorial(_ int: Int) -> Int {
    var result = 1
    for i in 1...int {
        result = result * i
    }
    return result
}

factorial(3)

// 재귀함수 : 자기자신을 반복해서 호출
func factorialF(num: Int) -> Int {
    // 이부분에서 함수를 멈추게 할 논리 필요.
    // 스택 영역의 메모리 용량을 넘어선 프로그래밍으로 인해 생기는 오류 -> 스택 오버플로우
    if num <= 1 {
        return 1
    }
    return num * factorialF(num: num - 1)
}

factorialF(num: 3)
