import UIKit

// if문과 유사하게 쓰이는 guard문
// 불만족하는 조건을 사전에 걸러내는 조건문

/**====================================================
 1) else문을 먼저 배치 - 먼저 조건을 판별하여 조기 종료 early exit
 2) 조건을 만족하는 경우 코드가 다음 줄로 넘어가서 계속 실행
 3) 가드문에서 선언된 변수를 아래문장에서 사용 가능. (동일한 스코프로 취급)
 =======================================================**/


func checkNumbersOf1(password: String) -> Bool {
    if password.count >= 6{return true}
    else {return false}
}

func checkNumbersOf2(password: String) -> Bool {
    guard password.count >= 6 else {return false}
    return true
}



// discardableResult
// @어트리뷰트 키워드 - 컴파일러에게 추가적인 정보를 제공하는 역할을 하는 키워드
// 1) 선언에 추가적인 정보 제공
// 2) 타입에 추가정보 제공

@discardableResult
func someFunction() -> Bool {
    return ""
}

// 리턴값이 있는 함수에서 리턴값을 사용하지 않는다면 워닝이 떠서
_ = someFunction()

// swift 5.2버전 부터
// @discardableResult
// 어트리뷰트 키워드를 사용하도록 함
someFunction()
