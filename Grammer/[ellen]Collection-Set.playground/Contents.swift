import UIKit

// Set : 수학에서의 집합과 비슷한 연산을 제공하는, 순서가 없는 컬렉션
// 생성시 타입 선언을 해야함
// 요소값을 중복으로 넣어도, 집합의 의미상 요소 중복 저장이 안된다. 각 요소는 유일한 값이다 Hashable

// 내부적으로 값의 검색에 Hashing 알고리즘을 사용하므로 정렬순서보다 검색속도가 중요한 경우에 사용 (요소는 유일, 빠른 검색)

var set: Set = [1,2,3,4,5,1,3,2]
var setOrigin: Set<Int> = [1,2,3,4,5,1,3,2]

print(set)

let emptySet : Set<Int> = []
let emptySet2 = Set<Int>()

set.count
set.isEmpty
set.contains(1)
set.randomElement()


// 업데이트 - 삽입하기 / 교체하기 / 추가하기
// 서브스크립트 관련 문법이 없음 ⭐️

set.update(with: 1) // optional
set.update(with: 7) // 새로운 요소가 추가되면 리턴 nil

// set은 append 함수 제공하지 않음.

// 삭제 가능 remove
//set.removeAll()
//set.remove(at: <#T##Set<Int>.Index#>)


// ⭐️ KeyValuePairs
// 딕셔너리와 유사한 형태이지마느 배열처럼 순서가 있는 컬렉션
let introduce: KeyValuePairs = ["first":"Hello"]

// 요소에 접근
// 배열처럼 인덱스로 접근
introduce[0]
// 요소에서는 튜플 방식으로 접근 가능
introduce[0].0
// 반복문에서 사용
for value in introduce {
    print("\(value.key) : \(value.value)")
}

// ⭐️ Copy-On-Write 최적화
// 코드상에서 값을 복사해서 담는다 하더라도, 실제 값이 바뀌기 전까지는 그냥 하나의 메모리 값을 공유해서 사용.
// (메모리를 적게 차지하기 위해서 스위프트 언어가 알아서 내부에서 처리하는 메커니즘)

var array = [1,2,3,4,5,6,7]
var subArray = array[0...2] // 이런 경우에 카피온라이트 최적화가 일어났다고 할수있다. 
