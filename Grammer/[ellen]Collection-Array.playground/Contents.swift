import UIKit

// Swift Collection
// 데이터를 효율적으로 관리하기 위한 자료형(타입)

let strArray = Array<String>()
let strArrayShort:[String] = ["iOS", "Swift", "android", "kotlin"]

// 빈배열을 생성
let emptyArray:[Int] = []
let emptyArray2 = Array<Int>()
let emptyArray3 = [Int]()


// 배열의 기본 기능
var numsArray = [nil,2,3]

numsArray.count
numsArray.isEmpty
numsArray.contains(5) // 파라메터로 값을 전달
numsArray.randomElement()
numsArray.swapAt(0, 1)

// 배열의 각 요소에 대한 접근
numsArray[0]
numsArray[1]

numsArray[0] = 10
numsArray.first
numsArray.last

strArray.first   // 리턴값이 옵셔널 => 빈배열이라면 nil리턴

// 배열의 시작 인덱스
numsArray.startIndex // 무조건 0
numsArray.endIndex // 전체 길이 + 1

numsArray.index(0, offsetBy: 2)
numsArray.endIndex.advanced(by: -1)

strArrayShort.firstIndex(of: "kotlin") // 앞에서 부터 찾았을때 android는 배열의 (앞에서부터) 몇번째?
strArrayShort.lastIndex(of: "kotlin") // 뒤에서 부터 찾았을때 android는 배열의 (앞에서부터) 몇번째?


// 삽입하기
var alphabet = ["A", "B", "C", "D", "E", "F", "G"]
// 앞 또는 중간에 삽입하기
alphabet.insert("H", at: 7)

alphabet.insert("2", at: 0)

alphabet.insert(contentsOf: ["J", "K"], at: 8)

// 교체 하기
alphabet[0] = "A"
alphabet[0...2] = ["1", "2", "3"]
alphabet

// 원하는 범위 삭제
alphabet[0...1] = []
alphabet


// 교체하기 함수 문법
alphabet.replaceSubrange(0...2, with: ["a", "b", "c"])

// 추가하기 append
alphabet += ["M"]

alphabet.append("N")
alphabet.append(contentsOf: ["Q", "X"])


// 삭제하기
alphabet[0...2] = []
alphabet.remove(at: 2)
alphabet.remove(at: alphabet.endIndex - 1)
alphabet


alphabet.removeSubrange(0...2)

alphabet = ["A", "B", "C", "D", "E", "F", "G"]

alphabet.removeFirst()
alphabet.removeFirst(2) // 앞에 있는 두개를 지우는것
alphabet.removeLast()

alphabet.removeAll()
//alphabet.removeAll(keepingCapacity: true) // 저장공간을 일단은 보관해둠 (안의 데이터는 일단 날린다) 나중에 재사용 할때 메모리 공간을 날린것보다 빠름

// 배열의 기타 기능
var nums = [1,3,4,5,2,35,67,7, 90]

//nums.sort() // 원본 배열 자체를 변경
nums.sorted() // 원본 배열 자체를 변경하지 않고 변경된 배열을 리턴함.
nums

// ⭐️ 보통 apple api 함수들 명명 방식을 잘 볼것!
// 동사원형을 사용하면 컬렉션 자체를 직접적으로 변환!
// -ed로 생긴것들은 컬렉션 자체를 변환하지 않고, 변환된 것을 반환함!


nums.shuffled()

// 배열의 비교가능!
// 활용
var puppy1 = ["p", "u", "p", "p", "y"]

if let lastIdxOfP = puppy1.lastIndex(of: "p") {
    puppy1.remove(at: lastIdxOfP)
    puppy1
}

if !nums.isEmpty {
    print("\(nums.count) elements")
} else {
    print("empty array")
}


var data = [[1,2,3], [4,5,6], [7,8,9]]
data[0][2]

// 반복문
// enumerated

for tuple in nums.enumerated() {
    print(tuple) // (offset: 1, element: 3)
    print("\(tuple.0) - \(tuple.1)")
}
