import UIKit



/** Tuples (n쌍, n값) */
var topTitle = ("메인화면", "mainIcon.png")
var httpError = (statusCode: 404, description: "not found")
httpError.statusCode
httpError.description


/** Optional_1*/
// 값이 있을 수도 있고 없을 수도 있다.
// 값이 있다.
// 값이 없다. -> nil

// 0 -> 다쓴 상태인 값. 값이 있다.
// null (nil) -> 값이 없는 상태.

var myAge:Int? = 0

// 값이 없는 상태 체크 -> 아래 로직은 Swift 언어 스펙으로는 틀린 로직이다!
if myAge == 0 {
    // alert - 나이를 입력해 주세요
}

// 옳은 로직
if myAge == nil {
    // alert - 나이를 입력해 주세요
}

var myName: String? = "" // 값이 있는 상태. 값이 빈스트링인 상태. 값이 없냐고 물어보는것은 잘못된 로직이다.
if myName == nil {
    // 이름 값이 없음.
}

/**Optional_2*/
// 옵셔널 그냥 사용 할 수 없는 경우가 많다.
var a:Int? = 10
var b:Int? = 20

// unwrap
// Int? -> Int
// String? -> String
// 1.coalesce :  "??" 사용하기 ->(a ?? 0)
// 2.force unwrap : b! 무조건 값이 있는 상태로 변경한다.
// 주의사항: 이 값이 무조건 있다고 확신이 있을때 사용 , 왠만하면 사용 x / 앱이 죽는 치명적인 상황 발생..
var c = (a ?? 0) + b!

// 3. if Statement
if a != nil {
    print(a!)
}

// if let
// if var
if let hasNumber = a {
    print(hasNumber)
}

if var hasNumber = a {
    hasNumber = hasNumber * 2
    print(hasNumber)
}

// guard let
// guard var
// guard 아래로직이 실행될지 안될지 정하고 싶을때? 값이 없을때 그 이후의 로직을 실행하고 싶지 않을때 사용/ 아니라면 if문 사용
func testFunc() {
    guard let hasNumber = a else {
        // escape 가장 바깥쪽에 사용하는 경우는 없음.
        return
    }
    print(hasNumber)
}

testFunc()

/**기초 연산자 **/
// %
// 홀수 짝수
let bbb:Double = 33.333
if bbb.truncatingRemainder(dividingBy: 2) == 0 {
    print("짝수")
} else {
    print("홀수")
}

/**unicode 범위 관련**/
// 숫자만 입력받을 수 있어야 한다.
let inputValue = "8"
"\u{30}"
"\u{39}"

// 영어만 입력해야한다
"\u{41}"
"\u{7a}"

/**String**/
a?.description
String(a!)
"my number is \(a!)"
"""
hi
   hello
"""
