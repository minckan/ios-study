import UIKit

// inheritance
// 상속 - class

//
class UserInfo {
    var name = ""
    var age = 0
    func isAdult() ->Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

// 상속 받았을때 구현할 필요 없음 오버라이드 할수 있다.
class Guest:UserInfo {
    override func isAdult() -> Bool {
        return true
    }
    
    func present() {
        name = "kim"
        print(name)
        print(super.name)
        print(isAdult())
        print(super.isAdult())
    }
}

let guest = Guest()
guest.present()

// generic
// 로직 -> 반복, 타입 여러가지

// stack
struct IntStack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T? {
        if items.isEmpty {
            return nil
        }
        return items.removeLast()
    }
}

var myStack = IntStack<Int>()
myStack.push(item: 3)
myStack.push(item: 4)
myStack.push(item: 5)

myStack.pop()
myStack.pop()
myStack.pop()
myStack.pop()


//Higher order function
//고차함수

let names = ["kim", "lee", "min", "john"]

// map
let nameTo = names.map { $0 + "님" }

nameTo // ["kim님", "lee님", "min님", "john님"]

// filter
let nameFiltered = names.filter { name -> Bool in
    name.count > 3
}

nameFiltered // ["john"]

// reduce :  하나로 뭉친다. 통합. 합친다.
let nameReduced = names.reduce("") { $0 + $1
}


nameReduced // "kimleeminjohn"

let numberArr = [1,2,3,4,5, nil, 6, nil, 8]
let sumNum = numberArr.reduce(0) { $0 + ($1 ?? 0)}

sumNum // 29

//compactMap
let number = numberArr.compactMap { num in
    return num
}

number // [1, 2, 3, 4, 5, 6, 8]

// flatmap
let numbers = [[1,2,3], [4,5,6]]
let flatmap = numbers.flatMap { $0 }
flatmap // [1, 2, 3, 4, 5, 6]
