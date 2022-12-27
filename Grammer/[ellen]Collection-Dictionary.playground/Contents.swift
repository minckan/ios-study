import UIKit

// Dictionary
// 데이터를 키와 값으로 하나의 쌍으로 만들어 관리하는 컬렉션
// - 대괄호로 묶음. 각 요소는 키와 값의 쌍을 콜론으로 처리
// ***규칙
// - 키값은 유일해야한다. 벨류값은 중복가능하다
// - 동일한 타입 쌍의 데이터만 담을 수 있다.
// - 딕셔너리의 값에 딕셔너리 또는 배열을 사용하여서 중첩적으로 사용 가능하다
var test: [String: [Int]] = ["A": [1,2,3]]
// - 딕셔너리의 키값은 hashable 해야한다. -> 검색속도가 빠르다.
// ↪️ Hash함수 : 고정된 길의 유일한 숫자 혹은 문자로 변환해준다
// ↪️ Hashable 해시함수에 input으로 쓰일수 있는 타입.
// ↪️ 스위프트의 기본타입들은 hashable하다. (값의 유일성이 보장)
// ↪️ 커스텀 타입을 Hashable하게 사용하려면 -> (Hashable 프로토콜 채택)
// ↪️ 해시 테이블의 자료 구조상, 매우 빠른 검색 알고리즘에서 사용됨 -> 딕셔너리 , Set은 배열보다 빠른 검색을 가능케한다.


var dic = ["A": "Apple", "B": "Banana", "C": "City"]
var dic1 = [1: "Apple", 2: "Banana", 3: "City"]

print(dic)

let words1: [String: String] = [:]
let words2: Dictionary<Int, String>

// 빈 딕셔너리 생성
let emptyDic1 : Dictionary<Int, String> = [:]
let emptyDic2 = Dictionary<Int, String>()
let emptyDic3 = [Int: String]()


// 타입 정보가 없으면 유추할 수 없어 에러
// 이미 위에서 타입을 정의했다면, 아래에서 빈 값으로 넣는 것은 괜찮음

dic1 = [:]

// 딕셔너리의 기본 기능
dic.count
dic.isEmpty

dic.randomElement() // named tuple 형태로 리턴, 옵셔널
print(dic.randomElement())

// 딕셔너리의 각 요소에 대한 접근
// 서브스크립트([])를 이용한 문법을 주로 사용한다.
dic["A"]
print(dic["A"]) // Optional("Apple")

if let hasData = dic["A"] {
    print(hasData)
}


// 딕셔너리는 값만 따로 검색하는 방법은 제공하지 않음 ⭐️
// 서브스크립트 문법으로 키를 전달

dic["S", default: "Empty"] // S를 전달하는데 값이 없으면 Empty를 반환하겠다. / nil 이 발생할 확률이 없음.



print(dic.keys)
print(dic.values)

dic.keys.sorted()
dic.values.sorted()


for key in dic.keys.sorted() {
    print(key)
}


// ⭐️⭐️⭐️ 업데이트 하기! Update - 삽입하기, 교체하기, 추가하기

dic["A"] = "Audio"
dic.updateValue("Done", forKey: "D") // 비어있을 때는 insert
dic.updateValue("Done", forKey: "D") // 새로운 요소가 추가되면 ==> nil 리턴
dic = ["A":"All"]

dic.count

dic["A"] = nil
dic.removeValue(forKey: "C")
dic.removeAll()


// 딕셔너리의 비교
let a = ["A": "Apple", "B": "Banana", "C": "City"]
let b = ["A": "Apple", "C": "City", "B": "Banana"]

a == b // true, 순서가 없으나 같다고 함! 순서가 중요하지 않음.

// 딕셔너리의 활용
var dict1 = [String: [String]]() // 딕셔너리 value에 배열이 들어갈수 있다.
dict1["arr1"] = ["A", "B", "C"]
dict1["arr2"] = ["D", "E", "F"]
dict1

var dict2 = [String: [String: Int]]()
dict2["dic1"] = ["name": 1, "age": 2]
dict2["dic2"] = ["name": 2, "age": 4]
dict2


// 반복문과의 결합
// 딕셔너리는 열거하지 않아도, Named 튜플 형태로 하나씩 꺼내서 전달
// 순서가 없으므로, 실행마다 순서가 달라진다!⭐️

// 데이터 바구니이기 때문에,
// 차례대로 하나씩 꺼내서 사용하는 경우가 많을 수 있어서 아래처럼 활용가능하다.
dic = ["A": "Apple", "B": "Banana", "C": "City"]

for (key, value) in dic {
    print("\(key): \(value)")
}

for (key, _) in dic {
    print("key: \(key)")
}

let array = ["A", "B", "C"]
let arrayEnumer = array.enumerated()
for i in arrayEnumer {
    print(i)
}
