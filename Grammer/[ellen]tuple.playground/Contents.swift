import UIKit

// 튜플 : 2개 이상의 연관된 데이터를 저장하는 컴파운드(복합/혼합) 타입

let twoNumbers : (Int, Int) = (1,2)
let threeNumbers : (Int, Int, Int) = (1,2,3)

var human = ("홍길동", 20, "서울")

//human = ("강민주", "제주") // Cannot assign value of type '(String, String)' to type '(String, Int, String)'


// 연관된 값의 각각의 데이터에 접근
human.0
human.1
human.2

// Named Tuple 이름이 매겨진 튜플 <- 코드의 가독성이 좋아짐
let iOS = (language: "Swift", version: 5)
iOS.language
iOS.version

// 튜플의 분해(Decomposition)
// 튜플의 데이터 묶음을 각 한개씩 분해해 상수나 변수에 저장 가능
// 모아놓았던 데이터를 분해해서 사용하고 싶을 경우
let (first, second, third) = threeNumbers

first
second
third



// 튜플 값을 비교 - 실제 사용하는 경우는 흔하지 않음
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")


// ***** 튜플의 활용
// 이런 코드를 아래 스위치 문을 사용하면 단순해짐
if iOS.0 == "Swift" && iOS.1 == 5 {
    print("스위프트 버전 5입니다.")
}

if iOS == ("Swift", 5) {
    print("스위프트 버전 5입니다.")
}

// 스위프트의 스위치문은 튜플 매칭을 지원 ==> 코드를 단순한 형태로 표현가능
switch iOS {
case ("Swift", 5):
    print("스위프트 버전 5입니다.")
default:
    break
}


// 튜플의 바인딩
var cordinate = (9,0)
switch cordinate {
case (let distance, 0), (0, let distance) :
    print("X 또는 Y축 위에 위치하며, \(distance)만큼 거리가 떨어져있음")
default:
    print("축 위에 있지 않음")
}


// 튜플의 where절 활용
cordinate = (1,-1)

switch cordinate {
case (let x, let y) where x == y :
    print("(\(x), \(y))의 좌표는 y = x 1차함수의 그래프 위에 있다.")
case let (x,y) where x == -y:
    print("(\(x), \(y))의 좌표는 y = -x 1차 함수의 그래프 위에 있다.")
case let (x,y):
    print("(\(x), \(y))의 좌표는 y = x, 또는 y = -x 그래프가 아닌 임의의 지점에 있다.")
}
