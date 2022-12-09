import UIKit

// Collection Type => array, dictionary, set

/**Array**/
var myNames = Array<String>()
var myAges = [Int]()

myNames.append("min")
myNames.append("ju")
myNames.append("kang")

myNames[0]


// 방어코드
// 안전한 코딩 스타일
let index = 3
if myNames.count > index {
    myNames[index]
}


myNames.append(contentsOf: ["na", "kyung", "won"])

myNames = myNames + ["na", "kyung", "won"]

myNames.removeLast()

if myNames.isEmpty {
    
}

if myNames.count == 0 {
    
}

myNames.insert("11111", at: 3)

for(index, k )in myNames.enumerated() {
    print("\(k) 님 ==> \(index)")
}



/**Set : 순서가 없다, 중복이 없다.  **/

var names = Set<String>()
names.insert("kang")
names.insert("min")
names.insert("ju")

names.insert("kang")

var sameNames = ["min", "ju", "kang", "min"]
Set(sameNames)
names


var names2:Set = ["min", "ju", "min"]

// 집합에 대한 연산
var name11 : Set = [1,2,3,4,5]
var name22 : Set = [4,5,6,7,8]

// 교집합
name11.intersection(name22)
// 합집합
name11.union(name22)
// 합집합에서 교집합을 뺀값
name11.symmetricDifference(name22)
// 여집합
name11.subtracting(name22)

name11.count

/** Dictionary : 원한는 key에 원하는 value, 순서 없음*/
var namesOfStreet = [String: Any]()

namesOfStreet["302ro"] = "1st steet"
namesOfStreet["303ro"] = "2nd steet"
namesOfStreet["304ro"] = 3


namesOfStreet["302ro"] = nil

var namesOfStreet2 = ["a": 1, "b":2]

print(namesOfStreet.keys)

for (i,k) in namesOfStreet.enumerated() {
    print(i, k)
}


// control flow 흐름제어

