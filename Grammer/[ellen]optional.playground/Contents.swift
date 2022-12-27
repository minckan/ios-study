import UIKit



// Optional

var yourname:String?  // nil :  값이 없는것이 아니고, 값이 없음을 의미  != null -> null은 실제 값이 없음.

// 1) 옵셔널 타입은 값이 없는 경우 nil를 포함하는 타입.
// 2) 옵셔널 타입과 옵셔널이 아닌 타입은 서로 다른 타입이다 ⭐️
// 3) 옵셔널 타입에 값을 대입하지 않으면 nil로 초기화 됨.
// 4) 옵셔널 타입은 항상 변수로 사용. (상수x)

let optional : Optional<Int> = 0
var optionalSimple : Int? = 0

optionalSimple = 10

print(optionalSimple) // Optional(10) <-- 사용하려면 옵셔널을 벗겨야함.


// 5) 옵셔널 타입끼리의 연산은 불가능. 임시적인 타입끼리는 연산이 안됨.


/**==============================옵셔널 추출방법==============================**/
// 1) 강제로 값을 추출: 값이 있다는 것이 확실할 때 사용
print(optionalSimple!)

// 2) if문으로 nil이 아니라는 것 확인 후 , 강제로 벗겨내기
if optionalSimple != nil {
    print(optionalSimple!)
}

// 3) 옵셔널 바인디 (if let 바인딩/ guard let) ⭐️⭐️⭐️
// 바인딩이 된다면, 특정 작업을 하겠다는 의미.
if let s = optionalSimple {
    print(s)
}

func doSomething(name: String?) {
    guard let n = name else {return}
    print(n)
}

// 4) nil coalescing 연산자 사용 : coalescing -> 영어로 더 큰덩어리로 합친다.
// 옵셔널 타입에 대하여, 디폴트 값을 제시할 수 있을 때 사용
// (직접 값을 벗겨서 사용하는 것은 아니고, 디폴트값 제시를 통해 옵셔널 가능성을 없애는 방법)

var optionalSimpleCoalescing = optionalSimple ?? 5 // IntType

print(optionalSimpleCoalescing)


// 옵셔널 체이닝
// - 옵셔널 타입으로 선언된 값에 접근해서, 속성, 메서드를 사용할 때 접근 연산자(.) 앞에 물음표를 붙여야함.

// IUO 타입 :  암시적 추출 옵셔널 타입.
