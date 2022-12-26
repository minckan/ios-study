import UIKit

// first <-- argument label
func someFunction(first name : String) {
    print(name)
}

// wild card pattern : argument label 생략
func addPrintFunction(_ firstNum: String, _lastNum: String) {
    print(firstNum)
}

// 가변 파라미터 - 함수의 파라미터에 갯수가 정해지지 않은, 여러개의 값을 넣는 것도 가능 ( Variadic Parameter )
/**=================================================================================
    - 1) 하나의 파라미터로 2개 이상의 아큐먼트를 전달할 수 있다.
    - 2) 아규먼트는 배열 형태로 전달된다.
    - 3) 가변 파라미터는 개별함수 마다 하나씩만 선언할 수 있다. 선언순서는 상관없음
    - 4) 가변 파라미터는 기본값을 가질 수 없다.
 =====================================================================================**/

func arithmeticAverage(_ numbers: Double...) -> Double {
    var total = 0.0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticAverage(5,6,7,8,9)
arithmeticAverage(7, 0.25, 3.5)


// 함수의 파라미터에 기본값을 정하는 것도 가능
func numFunction(num1: Int, num2: Int = 8) -> Int {
    return num1
}

print("안녕하세요", "강민주", separator: ":")

/** =====================================================================================**/
// 함수 사용시 주의점
//1. 파라미터로 선언하는 값은 상수로 선언하는 것이다.
//2. 함수 내의 변수 스코프
//3. return 키워드의 정확한 이해: 리턴타입이 없는 경우 리턴할 경우 함수를 벗어나게 됨.함수를 종료.
//4. return 타입이 있는 경우, 함수의 실행문의 의미
//5. 함수의 중첨 사용 - 중첩된 함수 Nasted Function

/** =====================================================================================**/
// 함수의 타입 표기 방법

var function1: (Int, Int) -> Int = numFunction(num1:num2:)


/** =====================================================================================**/
// 함수의 오버로딩
// 같운 이름의 함수에 매개변수를 다르게 선언하여, 하나의 함수 이름에 실제 여러개의 함수를 대응 시키는 것
// ---> 쉽게 말하면 함수 이름의 재사용.

// 스위프트는 오버로딩을 지원하는 언어이다.
// ⭐️ 함수 이름, 파라미터 수/자료형, 아규먼트 레이블, 리턴형을 모두 포함해서 함수를 식별
// 실제 애플에서 만들어 놓은 함수들에도 오버로딩을 사용한 함수들이 많음.
func doSomething(value: Int) {
    
}

func doSomething(value: Double) {
    
}

func doSomethindg(value: String) {
    
}
